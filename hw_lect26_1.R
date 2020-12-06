# Install the R package called nnet. Then,
library(nnet)
# Simply run the following block, which makes the object "data." 
# The 1st (2nd) column is x (y).
# You don't need to understand what this block does.
 n = 100
 n.hd = 4 # This assures that the true H is 4.
 n.in = n.out =1
 input = seq(-1,1,length=n)
 target = rep(1,n) # Not used, but necessary for nnet()
 n.wts = (n.in+1)*n.hd + (n.hd+1)*n.out
 set.seed(1)
 nn.1 = nnet(input, target, size = n.hd, rang=10, maxit = 0, linout=T)
 output = predict(nn.1)
 y = output + rnorm(n, 0, 0.3)
 data = data.frame(input,y)
 plot(input, output, type="l")
 lines(input, y , type="p",col=2)
# Now, do go through the rest of this code and understand what it does. The idea behind it is
# explained in the "bootstrap" part of the lecture.
 set.seed(1)
 ntrial = 300 # number of (re) samples that will be taken.
 SSE_vld0 = SSE_vld4 = SSE_vld8 = SSE_vld16 = SSE_vld_lm = numeric(ntrial)
 SSE_trn0 = SSE_trn4 = SSE_trn8 = SSE_trn16 = SSE_trn_lm = numeric(ntrial)
 for( trial in 1:ntrial){
  trn = sample(1:n, 90, rep=T) # Take a (re) sample of size 90.
  nn = nnet( data[trn,1], data[trn,2], skip=T, linout=T, size = 0) # The only argument you need
  # to know about is "size" which is what I called H in the lecture, i.e., the number of hidden
  # nodes.
  SSE_trn0[trial] = nn$value # This returns/selects SSE.
  pred_nn = predict(nn, newdata=data.frame(data[-trn,1])) # -trn means everything other than trn.
  SSE_vld0[trial] = sum(( pred_nn - data[-trn,2] )^2 )
  nn = nnet( data[trn,1], data[trn,2], linout=T, size = 4) # Repeat for H = 4
  SSE_trn4[trial] = nn$value
  pred_nn = predict(nn, newdata=data.frame(data[-trn,1]))
  SSE_vld4[trial] = sum(( pred_nn - data[-trn,2] )^2 )
  nn = nnet( data[trn,1], data[trn,2], linout=T, size = 8) # H = 8
  SSE_trn8[trial] = nn$value
  pred_nn = predict(nn, newdata=data.frame(data[-trn,1]))
  SSE_vld8[trial] = sum(( pred_nn - data[-trn,2] )^2 )
  nn = nnet( data[trn,1], data[trn,2], linout=T, size = 16) # H = 16
  SSE_trn16[trial] = nn$value
  pred_nn = predict(nn, newdata=data.frame(data[-trn,1]))
  SSE_vld16[trial] = sum(( pred_nn - data[-trn,2] )^2 )
  
  # CODE THAT I PUT IN
  x = data[trn,1]
  y = data[trn,2]
  lm.1 = lm( y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9))
  SSE_trn_lm[trial] = summary.aov(lm.1)[[1]][10,2]
  
  new.data = data.frame(data[-trn,1])
  colnames(new.data) = c("x")
  pred_lm = predict(lm.1, newdata=new.data)
  SSE_vld_lm[trial] = sum(( pred_lm - data[-trn,2] )^2 )
} # end of loop over trial.
 
 # Here is one of the figs shown in the lecture note. It's more convenient to work with the
 # log of SSE; otherwise, the hists are all highly skewed. You can try without log, and see
 # for yourself.
 lim = log(range(SSE_trn0, SSE_trn4, SSE_trn8, SSE_trn16, SSE_vld0, SSE_vld4, SSE_vld8,
                 SSE_vld16))
 par(mfrow=c(4,1), mar=c(4,4,0,0))
 hist(log(SSE_trn0), breaks=40, xlim=lim, ylim=c(0,3), main="", xlab="log(SSE) H=0",
      freq=F)
 hist(log(SSE_vld0), breaks=50, add=T, border = 2, freq=F)
 hist(log(SSE_trn4), breaks=50, xlim=lim, ylim=c(0,3), main="", xlab="log(SSE) H=4",
      freq=F)
 hist(log(SSE_vld4), breaks=50, add=T, border = 2, freq=F)
 hist(log(SSE_trn8), breaks=30, xlim=lim, ylim=c(0,3), main="", xlab="log(SSE) H=
8",freq=F)
 hist(log(SSE_vld8), breaks=50, add=T, border = 2, freq=F)
 hist(log(SSE_trn16), breaks=30, xlim=lim, ylim=c(0,3), main="", xlab="log(SSE) H=16",
      freq=F)
 hist(log(SSE_vld16), breaks=50, add=T, border = 2, freq=F)
 # Here is a comparative boxplot, summarizing the above histograms:
 boxplot(log(SSE_trn0), log(SSE_trn4), log(SSE_trn8), log(SSE_trn16), range = 0, axes=F,
         ylab="log(SSE)", xlab="H", ylim=lim)
 boxplot(log(SSE_vld0), log(SSE_vld4), log(SSE_vld8), log(SSE_vld16), range = 0, axes=F,
         add=T, border=2, boxwex=0.5)
 axis(1,labels=c(0,4,8,16),at=c(1:4),cex.axis=1)
 axis(2, labels=T) ; box()
 # a) Based on the boxplots, one cannot tell if SE_vld4, SSE_vld8, and SSE_vld16 have truly
 # different means. To test that more objectively, perform an appropriate test, report the 
 # pvalue, and state your conclusion, at alpha = 0.05.
 
 # I used a t test to compare the means of both values
 # H0: true difference in means is equal to 0
 # H1: True difference in means is not equal to 0
 t.test(SSE_vld4, SSE_vld8)  # pvalue: 0.9701 -> We cannot reject H0 in favor of H1
 t.test(SSE_vld4, SSE_vld16) # pvalue: 0.1821 -> We cannot reject H0 in favor of H1
 t.test(SSE_vld8, SSE_vld16) # pvalue: 0.08769 -> We cannot reject H0 in favor of H1
 # Since at every t.test the p-value is greater than alpha, we can conclude that there
 # is not sufficient evidence to prove that the means of SSE_vld4, SSE_vld8, and 
 # SSE_vld16 are not equal.
 
 # b) Perform the appropriate test if we want to see whether SSE_vld4 is less than
 # SSE_vld8. Report the p-value, and state your conclusion, at alpha = 0.05 .
 
 # H0: SSE_vld4 > SSE_vld8
 # H1: SSE_vld4 < SSE_vld8
 t.test(SSE_vld4, SSE_vld8, alternative = "less") # pvalue = 0.485
 # Since pvalue > 0.05, we cannot reject H0 in favor in H1. Therefore, we do not have
 # sufficient evidence to prove SSE_vld4 < SSE_vld8
 
 # It is commonly believed that neural nets are "better" than regression. Let's prove that
 # wrong. To that end,
 
 # c) Revise the code above to ALSO compute SSE_trn_lm and SSE_vld_lm, corresponding to a 9
 # ^th order polynomial regression model. Hint: Here is how to do one instance of
 # regression:
 # LOOK AT CODE ABOVE!
 x = data[trn,1]
 y = data[trn,2]
 lm.1 = lm( y ~ x + I(x^2) + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9))
 summary.aov(lm.1)[[1]][10,2]
 new.data = data.frame(data[-trn,1])
 colnames(new.data) = c("x")
 pred_lm = predict(lm.1, newdata=new.data)
 sum(( pred_lm - data[-trn,2] )^2 )
 
 # d) Finally, make a comparative boxplot, like the one above, that includes SSE_trn_lm and
 # SSE_vld_lm. Do not worry about the x-axis labels.
 par(mfrow=c(1,1))
 boxplot(log(SSE_trn0), log(SSE_trn4), log(SSE_trn8), log(SSE_trn16), log(SSE_trn_lm),
         SSE_range = 0, axes=F,
         ylab="log(SSE)", xlab="H", ylim=lim)
 boxplot(log(SSE_vld0), log(SSE_vld4), log(SSE_vld8), log(SSE_vld16), log(SSE_vld_lm),
         range = 0, axes=F,
         add=T, border=2, boxwex=0.5)
 
 
 
 
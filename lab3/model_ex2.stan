data {
  int<lower=0> N;
  int<lower=0, upper=N> y;
}

parameters {
  real<lower=0, upper=1> p;
}

model {
  p ~ beta(2, 98); // prior
  y ~ binomial(N, p); // likelihood
}

generated quantities {
  int<lower=0,upper=N> y_pred;

  // Sample y_pred from the predictive distribution
  y_pred = binomial_rng(N, p);
}

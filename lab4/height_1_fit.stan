data {
  int<lower=0> N;  // number of samples
  real heights[N];  // array of heights
}

parameters {
  real<lower=0> mu;  // population mean
  real<lower=0> sigma;  // population standard deviation
}

model {
  // priors
  mu ~ normal(170, 10);  // prior on population mean
  sigma ~ normal(5, 2);  // prior on population standard deviation

  // likelihood
  heights ~ normal(mu, sigma);  // normal likelihood using population mean and standard deviation
}

generated quantities {
  real sampled_height = normal_rng(mu, sigma);  // sample a single height consistent with the model
}

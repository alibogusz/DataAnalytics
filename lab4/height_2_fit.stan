data {
  int<lower=0> N; // number of samples
  real heights[N]; // observed heights
  real weight[N]; // predictor variable
}

parameters {
  real<lower=0> alpha; // intercept
  real<lower=0> beta; // slope
  real<lower=0> sigma; // population standard deviation
}

transformed parameters {
  real mu[N];
  
  for (i in 1:N) {
    mu[i] = alpha + beta * weight[i];
  }
}

model {
  // Priors
  alpha ~ normal(175, 20);
  beta ~ normal(0, 10);
  sigma ~ normal(7, 5);
  
  // Likelihood
  for (i in 1:N) {
    heights[i] ~ normal(mu[i], sigma);   // likelihood of the data
  }
}

generated quantities {
  // Simulate heights consistent with the model
  real height[N];
  
  for (i in 1:N) {
    height[i] = normal_rng(mu[i], sigma);
  }
}

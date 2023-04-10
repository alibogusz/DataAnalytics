data {
  int<lower=0> N; // number of samples
  real<lower=0> heights[N]; // observed heights
  real<lower=0> weight[N]; // predictor variable
}

parameters {
  real<lower=0> alpha; // intercept
  real<lower=0> beta; // slope
  real<lower=0> sigma; // population standard deviation
}

transformed data {
  real weight_centered[N];
  real weight_mean;
  
  weight_mean = mean(weight);
  
  for (i in 1:N) {
    weight_centered[i] = weight[i] - weight_mean;
  }
}

transformed parameters {
  real mu[N];
  
  for (i in 1:N) {
    mu[i] = alpha + beta * weight_centered[i];
  }
}

model {
  // Priors
  alpha ~ normal(175, 20);
  beta ~ normal(0, 10);
  sigma ~ normal(7, 5);
  
  // Likelihood
  heights ~ normal(mu, sigma);
}

generated quantities {
  // Simulate heights consistent with the model
  real height[N];
  
  for (i in 1:N) {
    height[i] = normal_rng(mu[i], sigma);
  }
}

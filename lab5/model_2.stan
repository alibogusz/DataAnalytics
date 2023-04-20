data {
  int<lower=0> N; 
  int<lower=0> y[N]; 
  real miles[N]; 
}

parameters {
  real alpha;
  real theta;
}

transformed parameters {
  real lambda[N];
  for (i in 1:N) {
    lambda[i] = exp(alpha + theta * miles[i]);
  }
}

model {
  alpha ~ normal(2, 0.1);
  theta ~ normal(0.5, 0.2);
  for (i in 1:N){
      y[i] ~ poisson(lambda[i]);
  }
}

generated quantities {
    real y_sample[N];
    for (i in 1:N){
        y_sample[i] = poisson_rng(lambda[i]);
    }
}
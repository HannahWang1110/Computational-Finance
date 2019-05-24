function random_stocks=ran(output,ncol)
x = randperm(size(output,2),ncol);
random_stocks = output(:,x);


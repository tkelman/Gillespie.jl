using Gillespie

function F(x,parms)
  (S,I,R) = x
  (beta,mu) = parms
  infection = beta*S*I
  recovery = mu*I
  [infection,recovery]
end

x0 = [999,1,0]
nu = [[-1 1 0];[0 -1 1]]
parms = [0.1/1000.0,0.01]
tf = 250.0
srand(1234)

result = ssa(x0,F,nu,parms,tf)
@time result = ssa(x0,F,nu,parms,tf)

%considering a single check-in counter in an airport.  
% w(j) denote the waiting time of passenger i in the queue

clc;
clear all;
close all;
lambda=7;mu=10;sim_time=1000;
[arrivedtime,departedtime,nbrarrived]=MG1(lambda,mu,sim_time);
counter=0;
wq=lambda/(mu*(mu-lambda)) % Expected waiting time in the queue 
a=1/lambda;%arrival time
b=1/mu;%service time
for j=2:nbrarrived
    w(j)=0; %waiting time in the queue
    r1=rand();
    r2=rand();
    c=-a*log(r1); 
    d=-b*log(r2); 
    wait=w(j-1)-c+d;
    if wait>0
        w(j)=wait;
        if w(j)>wq
            counter=counter+1;
        end
    else
        w(j)=0;
    end
end
avg_wait=mean(w)
time_wasted=mean(w-wq)
out = ['Disturbance in the system occur ', num2str(counter), ' times'];
disp(out)
figure;histogram(w) %waiting time

%if w(j) is negative,service time is faster than arrival time meaning waiting time is 0.
%if w(j) is equal to expected waiting time system is stable
%if w(j) greater than expected waiting time, there is delay in the system.

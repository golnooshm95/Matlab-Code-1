%% Adaptive Quadrature Method
% May 03, 2019
% Author: Golnoosh Morshedi
function adaquad ()
clear
clc
global a b TOL N f
disp('------Enter Below Information------');
f = input('Function: ');
a = input('Lower bound: ');
b = input('Upper bound: ');
TOL = input('Tolerance: ');
N = input('Number of levels: ');

approximation = 0;
i = 1;
TOLi = 10*TOL;
ai = a;
hi = (b-a)/2;
FAi = f(a);
FCi = f(a+hi);
FBi = f(b);
Simp_i = hi*(FAi+(+4*FCi)+FBi)/3;
Li = 1;

while i>0
    FD = f((ai+hi)/2);
    FE = f((ai+(3*hi))/2);
    Simp_1 = (hi*(FAi+(4*FD)+FCi))/6;
    Simp_2 = (hi*(FCi+(4*FE)+FBi))/6;
    v1 = ai;
    v2 = FAi;
    v3 = FCi;
    v4 = FBi;
    v5 = hi;
    v6 = TOLi;
    v7 = Simp_i;
    v8 = Li;
    i = i-1;
    if abs(Simp_1+Simp_2-v7) < v6
        approximation = approximation+(Simp_1+Simp_2);
    else
        if v8 >= N
            fprintf('Exceeding Level')
            break
        else
            i = i+1;
            ai = v5+v6;
            FAi = v3;
            FCi = FE;
            FBi = v4;
            hi = v5/2;
            TOLi = v6/2;
            Simp_i = Simp_2;
            Li = v8+1;
            i = i+1;
            ai = v1;
            FAi = v2;
            FCi = FD;
            FBi = v3;
            hi = v5;
            TOLi = v6;
            Simp_i = Simp_1;
            Li = v8;
        end
    end
end
approximation

%fprintf('Intergral approximation of function by Adaptive Quadrature Method is: \n %d %.6g ',approximation);

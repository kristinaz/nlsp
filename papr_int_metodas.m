function saknis = papr_int_metodas(func_phi,x1,x2,x0,tol)
% Pilnu pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
% func_phi - is lygties f(x)=0 .
% tol = paklaida (pagal nutylejima 0.01).
% PALEIDIMAS: saknis = papr_int_metodas(func,x1,x2,x0,tol)
if nargin < 5; tol = 0.1; end
if nargin < 4
    x(1) = x1+(x2-x1)*rand(1); %atsitiktinai is intervalo (x1,x2)
else x(1) = x0; 
end

if nargin <3
    error('Maziausiai 3 parametrai turi buti ivesti');
    %disp('Maziausiai 3 parametrai turi buti ivesti');
    %saknis =NaN;
    %return;
end
%patikrina ar intervalo galuose neigija 0
f1 = func_phi(x1);
if abs(f1) < 10^(-10); saknis = x1; return;  end
f2 = func_phi(x2);
if abs(f2) < 10^(-10); saknis = x2; return; end
% Patikrina ar intervalo galuose igija priesingu zenklu reiksmes
if f1*f2 > 0;
    error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end

%KONVERGAVIMO SALYGOS PATIKRINIMAS

q = 0.5; %q reiksme tarp 0 ir -1
n =1;
paklaida = abs(x2-x1);
while paklaida>tol
    x(n+1) = func_phi(x(n));
    paklaida = ((1-q)/q)*abs(x(n+1)-x(n));
    n = n + 1;
    if (n > 10000) 
        disp(['Konvergavimo salyga neaptenkinta per -', num2str(n), ' interaciju']);
        break;
    end
end
disp(['Uztruko interaciju: ', num2str(n), '.'])



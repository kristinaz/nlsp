function [x1,x2] = skaidosmetodas(func,a,b,dx)
% Intervalo skaidos metodu surandamas intervalas (x1, x2), 
% kuriame yra maþiausias funkcijos nulis (maþiausia lygties f(x) = 0 ðaknis)
% NAUDOJIMAS: [x1,x2] = skaidosmetodas(@myfunc,a,b,dx)
% IVEDIMO PARAMETRAI:
% func = priskiriama M-failo myfunc.m funkcija (arba anonimine funkcija).
% a,b = pirminio intervalo pradþia ir pabaiga, a < b 
% dx = þingsnio ilgis: (b-a)/n.
% IÐVEDIMO PARAMETRAI:
% x1,x2 = maþiausio funkcijos nulio ribos: intervalas (x1,x2), 
% kuris yra poaibis (a,b);priskiriame NaN jeigu nebuvo surastas 
% toks intervalas

%TODO: Papildyti nargin "apsauga"!

% Patikriname ar a < b
if a >= b; x1 = NaN; x2 = NaN; return; end
x1 = a; f1 = func(x1);
x2 = a + dx; f2 = func(x2);
k = 1;
while f1*f2 > 0.0
    if x1 >= b
        x1 = NaN; x2 = NaN;
        return
    end
    x1 = x2; f1 = f2;
    x2 = x1 + dx; f2 = func(x2);
    k=k+1;
end
%disp(['Uztruko iteraciju: ', num2str(k), '.'])


function saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
% Pilnu pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
% func - funkcija, kaip m-failas arba anonimine funkcija.
% a < b, visas pirminis intervalas kuriame ieskosime funkcijos nulio(-u).
% dx = þingsnio ilgis, kreipiantis i skaidos metoda: (b-a)/n. 
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.01).
% PALEIDIMAS: saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
saknusk = 0;
a_pradinis = a;
while 1
    a
    b
    [x1,x2] = skaidosmetodas(func,a,b,dx);
    if isnan(x1)
        disp('Daugiau sprendiniu nera');
        break;
    else
        a = x2; 
        saknis = pusiaukirtosmetodas(func,x1,x2,0,tol);
        if ~isnan(saknis)
            saknusk = saknusk + 1;
            if saknis < b
                saknys(saknusk) = saknis;
            end
        end
    end
end
disp('darau')
x = a_pradinis:0.1:b;
y = func(x);
plot(x,y);
hold on;
x_saknys = saknys;
y_saknys = func(x_saknys);
scatter(x_saknys,y_saknys,'*r');
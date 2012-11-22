clc; clear; close all;
list_of_figures = {'cobra_flashing_alpha_fem_2in.fig','cobra_single_flm_4in.fig', 'nl_flashing_alpha_fem_2in.fig','nl_single_flm_4in.fig'};
N = size(list_of_figures,2);

for i = 1:N
    f(i).handle = open(list_of_figures{i});
    f(i).kids = get(f(i).handle,'Children');
    f(i).data_kids = f(i).kids(size(f(i).kids,1)/2+1:end);
    for j = 1:size(f(i).data_kids,1)
        f(i).grandkids(j).id = get(f(i).data_kids(j),'Children');
        for k = 1:size(f(i).grandkids(j).id,1)
           f(i).grandkids(j).data(k).time=get(f(i).grandkids(j).id(k),'XData'); 
           f(i).grandkids(j).data(k).var=get(f(i).grandkids(j).id(k),'YData');
        end
    end
end
close all;
%%
figure(1)
plot(f(1).grandkids(2).data(5).time,f(1).grandkids(2).data(5).var,f(3).grandkids(2).data(5).time,f(3).grandkids(2).data(5).var)
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)

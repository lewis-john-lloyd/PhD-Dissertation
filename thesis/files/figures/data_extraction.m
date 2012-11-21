clc; clear; close all;
list_of_figures = {'cobra_flashing_alpha_fem_2in.fig','cobra_single_flm_4in.fig', 'nl_flashing_alpha_fem_2in.fig','nl_single_flm_4in.fig'};
N = size(list_of_figures,2);

for i = 1:N
    f(i).handle = open(list_of_figures{i});
    f(i).kids = get(f(i).handle,'Children');
    f(i).data_kids = f(i).kids(size(f(i).kids,1)/2+1:end);    
end
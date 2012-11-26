clc; clear; close all;
list_of_figures = { 'cobra_flashing_alpha_fem_2in.fig',... % (1)
                    'cobra_single_flm_4in.fig',...         % (2)
                    'nl_flashing_alpha_fem_2in.fig',...    % (3)
                    'nl_single_flm_4in.fig',...            % (4)
                    'cobra_flashing_res_v_dt.fig',...      % (5)
                    'nl_flashing_res_v_dt.fig',...         % (6)
                    'cobra_single_res_v_dt.fig',...        % (7)
                    'nl_single_res_v_dt.fig'};             % (8)
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
           f(i).grandkids(j).data(k).legend_entry = strcat('$',regexp(get(f(i).grandkids(j).id(k),'DisplayName'),'.*{','match'),'\mathrm{MAX}}$ ',regexp(get(f(i).grandkids(j).id(k),'DisplayName'),'=.*','match'));
        end
    end
end
close all;
%%
figure(1)
plot(f(1).grandkids(2).data(5).time,f(1).grandkids(2).data(5).var,f(3).grandkids(2).data(5).time,f(3).grandkids(2).data(5).var)
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%%
figure(2)
plot(f(1).grandkids(2).data(1).time,f(1).grandkids(2).data(1).var,f(3).grandkids(2).data(1).time,f(3).grandkids(2).data(1).var)
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%%
figure(3)
plot(   f(1).grandkids(2).data(6).time, f(1).grandkids(2).data(6).var,...
        f(1).grandkids(2).data(5).time, f(1).grandkids(2).data(5).var,...
        f(1).grandkids(2).data(4).time, f(1).grandkids(2).data(4).var,...
        f(1).grandkids(2).data(3).time, f(1).grandkids(2).data(3).var,...
        f(1).grandkids(2).data(2).time, f(1).grandkids(2).data(2).var,...
        f(1).grandkids(2).data(1).time, f(1).grandkids(2).data(1).var)
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend( char(f(1).grandkids(2).data(6).legend_entry),...
                char(f(1).grandkids(2).data(5).legend_entry),...
                char(f(1).grandkids(2).data(4).legend_entry),...
                char(f(1).grandkids(2).data(3).legend_entry),...
                char(f(1).grandkids(2).data(2).legend_entry),...
                char(f(1).grandkids(2).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%%    
figure(4)
plot(   f(3).grandkids(2).data(6).time, f(3).grandkids(2).data(6).var,...
        f(3).grandkids(2).data(5).time, f(3).grandkids(2).data(5).var,...
        f(3).grandkids(2).data(4).time, f(3).grandkids(2).data(4).var,...
        f(3).grandkids(2).data(3).time, f(3).grandkids(2).data(3).var,...
        f(3).grandkids(2).data(2).time, f(3).grandkids(2).data(2).var,...
        f(3).grandkids(2).data(1).time, f(3).grandkids(2).data(1).var)
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend( char(f(3).grandkids(2).data(6).legend_entry),...
                char(f(3).grandkids(2).data(5).legend_entry),...
                char(f(3).grandkids(2).data(4).legend_entry),...
                char(f(3).grandkids(2).data(3).legend_entry),...
                char(f(3).grandkids(2).data(2).legend_entry),...
                char(f(3).grandkids(2).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
%%
figure(5)
plot(   f(3).grandkids(2).data(6).time, f(3).grandkids(2).data(6).var,...
        f(3).grandkids(2).data(5).time, f(3).grandkids(2).data(5).var...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend( char(f(3).grandkids(2).data(6).legend_entry),...
                char(f(3).grandkids(2).data(5).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%%
figure(6)
plot(   f(1).grandkids(2).data(3).time, f(1).grandkids(2).data(3).var,...
        f(1).grandkids(2).data(2).time, f(1).grandkids(2).data(2).var...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(1).grandkids(2).data(3).legend_entry),...
                char(f(1).grandkids(2).data(2).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%%
figure(7)
plot(   f(5).grandkids(1).data(5).time, f(5).grandkids(1).data(5).var,...
        f(5).grandkids(1).data(1).time, f(5).grandkids(1).data(1).var...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(5).grandkids(1).data(5).legend_entry),...
                char(f(5).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%%
figure(8)
plot(   f(6).grandkids(1).data(5).time, f(6).grandkids(1).data(5).var,...
        f(6).grandkids(1).data(1).time, f(6).grandkids(1).data(1).var...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(6).grandkids(1).data(5).legend_entry),...
                char(f(6).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
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
%%
close all;
%% flashing_1em1.eps
figure(1);
plot(   f(1).grandkids(2).data(5).time,f(1).grandkids(2).data(5).var,'- k',...
        f(3).grandkids(2).data(5).time,f(3).grandkids(2).data(5).var,'.-k'...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% flashing_1em5.eps
figure(2)
plot(   f(1).grandkids(2).data(1).time,f(1).grandkids(2).data(1).var,'- k',...
        f(3).grandkids(2).data(1).time,f(3).grandkids(2).data(1).var,'.-k'...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% cobra_flashing_al_2in.eps
figure(3)
plot(...%   f(1).grandkids(2).data(6).time, f(1).grandkids(2).data(6).var,'-ok',...
        f(1).grandkids(2).data(5).time, f(1).grandkids(2).data(5).var,'-+k',...
        f(1).grandkids(2).data(4).time, f(1).grandkids(2).data(4).var,'-.k',...
        f(1).grandkids(2).data(3).time, f(1).grandkids(2).data(3).var,': k',...
        f(1).grandkids(2).data(2).time, f(1).grandkids(2).data(2).var,'--k',...
        f(1).grandkids(2).data(1).time, f(1).grandkids(2).data(1).var,'- k')
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(...% char(f(1).grandkids(2).data(6).legend_entry),...
                char(f(1).grandkids(2).data(5).legend_entry),...
                char(f(1).grandkids(2).data(4).legend_entry),...
                char(f(1).grandkids(2).data(3).legend_entry),...
                char(f(1).grandkids(2).data(2).legend_entry),...
                char(f(1).grandkids(2).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% cobra_flashing_al_2in.eps
% figure(33)
% plot(   f(1).grandkids(2).data(6).time, f(1).grandkids(2).data(6).var,...
%         f(1).grandkids(2).data(5).time, f(1).grandkids(2).data(5).var,...
%         f(1).grandkids(2).data(4).time, f(1).grandkids(2).data(4).var,...
%         f(1).grandkids(2).data(3).time, f(1).grandkids(2).data(3).var,...
%         f(1).grandkids(2).data(2).time, f(1).grandkids(2).data(2).var,...
%         f(1).grandkids(2).data(1).time, f(1).grandkids(2).data(1).var,'k')
% axis([0 5 0.5 1])
% ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
% xlabel('Time [s]','Interpreter','latex','FontSize',16)
% fleg = legend( char(f(1).grandkids(2).data(6).legend_entry),...
%                 char(f(1).grandkids(2).data(5).legend_entry),...
%                 char(f(1).grandkids(2).data(4).legend_entry),...
%                 char(f(1).grandkids(2).data(3).legend_entry),...
%                 char(f(1).grandkids(2).data(2).legend_entry),...
%                 char(f(1).grandkids(2).data(1).legend_entry),...
%                 0);
% set(fleg,'Interpreter','latex','FontSize',16)
%% nl_flashing_al_2in.eps
% figure(44)
% plot(   f(3).grandkids(2).data(6).time, f(3).grandkids(2).data(6).var,...
%         f(3).grandkids(2).data(5).time, f(3).grandkids(2).data(5).var,...
%         f(3).grandkids(2).data(4).time, f(3).grandkids(2).data(4).var,...
%         f(3).grandkids(2).data(3).time, f(3).grandkids(2).data(3).var,...
%         f(3).grandkids(2).data(2).time, f(3).grandkids(2).data(2).var,...
%         f(3).grandkids(2).data(1).time, f(3).grandkids(2).data(1).var,'k')
% axis([0 5 0.5 1])
% ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
% xlabel('Time [s]','Interpreter','latex','FontSize',16)
% fleg = legend( char(f(3).grandkids(2).data(6).legend_entry),...
%                 char(f(3).grandkids(2).data(5).legend_entry),...
%                 char(f(3).grandkids(2).data(4).legend_entry),...
%                 char(f(3).grandkids(2).data(3).legend_entry),...
%                 char(f(3).grandkids(2).data(2).legend_entry),...
%                 char(f(3).grandkids(2).data(1).legend_entry),0);
% set(fleg,'Interpreter','latex','FontSize',16)
%% nl_flashing_al_2in.eps
figure(4)
plot(   f(3).grandkids(2).data(6).time, f(3).grandkids(2).data(6).var,'-ok',...
        f(3).grandkids(2).data(5).time, f(3).grandkids(2).data(5).var,'-+k',...
        f(3).grandkids(2).data(4).time, f(3).grandkids(2).data(4).var,'-.k',...
        f(3).grandkids(2).data(3).time, f(3).grandkids(2).data(3).var,': k',...
        f(3).grandkids(2).data(2).time, f(3).grandkids(2).data(2).var,'--k',...
        f(3).grandkids(2).data(1).time, f(3).grandkids(2).data(1).var,'- k')
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
%% nl_flashing_1em0_1em1.eps
figure(5)
plot(   f(3).grandkids(2).data(6).time, f(3).grandkids(2).data(6).var,': ',...
        f(3).grandkids(2).data(5).time, f(3).grandkids(2).data(5).var,'--',...
        f(3).grandkids(2).data(4).time, f(3).grandkids(2).data(4).var,'-.',...
        f(3).grandkids(2).data(3).time, f(3).grandkids(2).data(3).var,'--',...
        f(3).grandkids(2).data(2).time, f(3).grandkids(2).data(2).var,'- k'...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(3).grandkids(2).data(6).legend_entry),...
                char(f(3).grandkids(2).data(5).legend_entry),...
                char(f(3).grandkids(2).data(4).legend_entry),...
                char(f(3).grandkids(2).data(3).legend_entry),...
                char(f(3).grandkids(2).data(2).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% cobra_flashing_1em1_1em4.eps
figure(6)
plot(   f(1).grandkids(2).data(5).time, f(1).grandkids(2).data(5).var,': k',...
        f(1).grandkids(2).data(4).time, f(1).grandkids(2).data(4).var,'-.k',...
        f(1).grandkids(2).data(3).time, f(1).grandkids(2).data(3).var,'--k',...
        f(1).grandkids(2).data(2).time, f(1).grandkids(2).data(2).var,'- k'...
        )
axis([0 5 0.5 1])
ylabel('$\alpha_g$ [-] @ 2 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(1).grandkids(2).data(5).legend_entry),...
                char(f(1).grandkids(2).data(4).legend_entry),...
                char(f(1).grandkids(2).data(3).legend_entry),...
                char(f(1).grandkids(2).data(2).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% cobra_flashing_res_compare.eps
figure(7)
plot(   f(5).grandkids(1).data(5).time, f(5).grandkids(1).data(5).var,'- k',...
        f(5).grandkids(1).data(1).time, f(5).grandkids(1).data(1).var,'--k'...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(5).grandkids(1).data(5).legend_entry),...
                char(f(5).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% nl_flashing_res_compare.eps
figure(8)
plot(   f(6).grandkids(1).data(5).time, f(6).grandkids(1).data(5).var,'- k',...
        f(6).grandkids(1).data(1).time, f(6).grandkids(1).data(1).var,'--k'...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{k})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(6).grandkids(1).data(5).legend_entry),...
                char(f(6).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% single_1em0.eps
figure(9)
plot(   f(2).grandkids(1).data(6).time,f(2).grandkids(1).data(6).var,'- k',...
        f(4).grandkids(1).data(6).time,f(4).grandkids(1).data(6).var,'-*k'...
        )
axis([0 5 0 1])
ylabel('$\dot{\mathrm{m}}_{\, l}$ [$\frac{\mathrm{lb}_{\mathrm{m}}}{\mathrm{s}}$] @ 4 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% single_1em5.eps
figure(10)
plot(   f(2).grandkids(1).data(1).time,f(2).grandkids(1).data(1).var,'- k',...
        f(4).grandkids(1).data(1).time,f(4).grandkids(1).data(1).var,'-*k' ...
        )
axis([0 5 0 1])
ylabel('$\dot{\mathrm{m}}_{\, l}$ [$\frac{\mathrm{lb}_{\mathrm{m}}}{\mathrm{s}}$] @ 4 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% single_1em3_zoom.eps
figure(11)
plot(   f(2).grandkids(1).data(3).time,f(2).grandkids(1).data(3).var,'- k',...
        f(4).grandkids(1).data(3).time,f(4).grandkids(1).data(3).var,'-*k'...
        )
axis([0.8 1.2 0 0.1])
ylabel('$\dot{\mathrm{m}}_{\, l}$ [$\frac{\mathrm{lb}_{\mathrm{m}}}{\mathrm{s}}$] @ 4 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% single_1em3.eps
figure(12)
plot(   f(2).grandkids(1).data(3).time,f(2).grandkids(1).data(3).var,'- k',...
        f(4).grandkids(1).data(3).time,f(4).grandkids(1).data(3).var,'-*k'...
        )
axis([0 5 0 1])
ylabel('$\dot{\mathrm{m}}_{\, l}$ [$\frac{\mathrm{lb}_{\mathrm{m}}}{\mathrm{s}}$] @ 4 [in] from Inlet','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
legend('Legacy Mode','Nonlinear Mode',0)
%% cobra_single_res_v_dt.eps
figure(13)
plot(   f(7).grandkids(1).data(6).time,f(7).grandkids(1).data(6).var,'-ok',...
        f(7).grandkids(1).data(5).time,f(7).grandkids(1).data(5).var,'-+k',...
        f(7).grandkids(1).data(4).time,f(7).grandkids(1).data(4).var,': k', ...
        f(7).grandkids(1).data(3).time,f(7).grandkids(1).data(3).var,'-.k',...
        f(7).grandkids(1).data(2).time,f(7).grandkids(1).data(2).var,'--k',...
        f(7).grandkids(1).data(1).time,f(7).grandkids(1).data(1).var,'- k' ...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(7).grandkids(1).data(6).legend_entry),...
                char(f(7).grandkids(1).data(5).legend_entry),...
                char(f(7).grandkids(1).data(4).legend_entry),...
                char(f(7).grandkids(1).data(3).legend_entry),...
                char(f(7).grandkids(1).data(2).legend_entry),...
                char(f(7).grandkids(1).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
%% nl_single_res_v_dt.eps
figure(14)
plot(   f(8).grandkids(1).data(6).time,f(8).grandkids(1).data(6).var,'-+k',...
        f(8).grandkids(1).data(5).time,f(8).grandkids(1).data(5).var,'-*k',...
        f(8).grandkids(1).data(4).time,f(8).grandkids(1).data(4).var,': k', ...
        f(8).grandkids(1).data(3).time,f(8).grandkids(1).data(3).var,'-.k',...
        f(8).grandkids(1).data(2).time,f(8).grandkids(1).data(2).var,'--k',...
        f(8).grandkids(1).data(1).time,f(8).grandkids(1).data(1).var,'- k' ...
        )
axis([0 5 0 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{k})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(8).grandkids(1).data(6).legend_entry),...
                char(f(8).grandkids(1).data(5).legend_entry),...
                char(f(8).grandkids(1).data(4).legend_entry),...
                char(f(8).grandkids(1).data(3).legend_entry),...
                char(f(8).grandkids(1).data(2).legend_entry),...
                char(f(8).grandkids(1).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
%% nl_res_single_zoom.eps
figure(15)
plot(   f(8).grandkids(1).data(6).time,f(8).grandkids(1).data(6).var,'-+k',...
        f(8).grandkids(1).data(5).time,f(8).grandkids(1).data(5).var,'-*k',...
        f(8).grandkids(1).data(4).time,f(8).grandkids(1).data(4).var,': k', ...
        f(8).grandkids(1).data(3).time,f(8).grandkids(1).data(3).var,'-.k',...
        f(8).grandkids(1).data(2).time,f(8).grandkids(1).data(2).var,'--k',...
        f(8).grandkids(1).data(1).time,f(8).grandkids(1).data(1).var,'- k' ...
        )
axis([.8 1.2 0 .1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{k})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(8).grandkids(1).data(6).legend_entry),...
                char(f(8).grandkids(1).data(5).legend_entry),...
                char(f(8).grandkids(1).data(4).legend_entry),...
                char(f(8).grandkids(1).data(3).legend_entry),...
                char(f(8).grandkids(1).data(2).legend_entry),...
                char(f(8).grandkids(1).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
%% flashing_semilogy_res_compare_nl.eps
figure(16)
semilogy(   f(6).grandkids(1).data(5).time, f(6).grandkids(1).data(5).var,'- k',...
            f(6).grandkids(1).data(1).time, f(6).grandkids(1).data(1).var,': k'...
        )
axis([0 5 1e-8 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{k})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(6).grandkids(1).data(5).legend_entry),...
                char(f(6).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% flashing_semilogy_res_compare_lin.eps
figure(17)
semilogy(   f(5).grandkids(1).data(5).time, f(5).grandkids(1).data(5).var,'-k',...
            f(5).grandkids(1).data(1).time, f(5).grandkids(1).data(1).var,':k'...
        )
axis([0 5 1e-8 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(5).grandkids(1).data(5).legend_entry),...
                char(f(5).grandkids(1).data(1).legend_entry),...
                0);
set(fleg,'Interpreter','latex','FontSize',16)
%% single_semilogy_res_v_dt_nl.eps
figure(18)
semilogy(   f(8).grandkids(1).data(6).time,f(8).grandkids(1).data(6).var,'-ok',...
            f(8).grandkids(1).data(5).time,f(8).grandkids(1).data(5).var,'-*k',...
            f(8).grandkids(1).data(4).time,f(8).grandkids(1).data(4).var,': k', ...
            f(8).grandkids(1).data(3).time,f(8).grandkids(1).data(3).var,'-.k',...
            f(8).grandkids(1).data(2).time,f(8).grandkids(1).data(2).var,'--k',...
            f(8).grandkids(1).data(1).time,f(8).grandkids(1).data(1).var,'- k' ...
            )
axis([0 5 1e-8 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{k})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(8).grandkids(1).data(6).legend_entry),...
                char(f(8).grandkids(1).data(5).legend_entry),...
                char(f(8).grandkids(1).data(4).legend_entry),...
                char(f(8).grandkids(1).data(3).legend_entry),...
                char(f(8).grandkids(1).data(2).legend_entry),...
                char(f(8).grandkids(1).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
%% single_semilogy_res_v_dt_lin.eps
figure(19)
semilogy(   f(7).grandkids(1).data(6).time,f(7).grandkids(1).data(6).var,'-ok',...
            f(7).grandkids(1).data(5).time,f(7).grandkids(1).data(5).var,'-*k',...
            f(7).grandkids(1).data(4).time,f(7).grandkids(1).data(4).var,': k', ...
            f(7).grandkids(1).data(3).time,f(7).grandkids(1).data(3).var,'-.k',...
            f(7).grandkids(1).data(2).time,f(7).grandkids(1).data(2).var,'--k',...
            f(7).grandkids(1).data(1).time,f(7).grandkids(1).data(1).var,'- k'  ...
            )
axis([0 5 1e-8 1])
ylabel('$\frac{||\mathbf{F}(\mathbf{x}^{1})||_2}{N}$ [-]','Interpreter','latex','FontSize',16)
xlabel('Time [s]','Interpreter','latex','FontSize',16)
fleg = legend(  char(f(7).grandkids(1).data(6).legend_entry),...
                char(f(7).grandkids(1).data(5).legend_entry),...
                char(f(7).grandkids(1).data(4).legend_entry),...
                char(f(7).grandkids(1).data(3).legend_entry),...
                char(f(7).grandkids(1).data(2).legend_entry),...
                char(f(7).grandkids(1).data(1).legend_entry),0);
set(fleg,'Interpreter','latex','FontSize',16)
% Projeto 2 de Simulação numérica
%{ 
O problema fisico modelado é a propagação de uma epidemia
O nosso problema está modelado sob as seguintes variáveis:
S - número de individuos suscetiveis
I - número de individuos infetados
R - número de individuos recuperados
a - taxa de infeção
r - taxa de recuperação


% Condições Iniciais
Sabemos que a cidade tem inicialmente tem 1000 pessoas
e encontram-se todas no estado suscetivel
S = 1000; % Número de indivíduos suscetíveis
I = 0;    % Número de indivíduos infectados
R = 0;    % Número de indivíduos recuperados
a = 0.002 por pessoa e por semana;  % Taxa de infecção
r = 0.15 por dia.

Sabemos que no Inicio entra na cidade de 1000 pessoas 1 pessoa infetada
formando assim 1001 pessoas

No problema não especifica o t -> Vou assumir que corresponde á evolução em
dias

Logo a taxa de infeção de uma pessoa por dia é
infectionPerDay = a / 7;
%}

%{
Avaliação do problema inicial ->
% Numero total de individuos = S(0) + I(0) + R(0)
%}

% O nosso modelo pode ser modelado por SIR
% Objetivo encontrar o sitio quando o número de infetados desce abaixo de
% 10 pela primeira vez.

S0 = 1000; % Number of susceptible people in the city = 1000
I0 = 1; % Number of infected people entering in the city = 1
R0 = 0; % Number of recovered people


SIR_STATE = [S0; I0; R0]; % Initial State SIR
deltaT = [0 150];

options = odeset('Events', @myEvent);

[t, dState] = ode45(@epidemia, deltaT, SIR_STATE, options)

[t, dState]

function [value, isterminal, direction] = myEvent(deltaT, SIR_STATE)
    value      = ~((SIR_STATE(2) - 10) < 0);
    isterminal = 1;   
    direction  = -1;
end

function dState = epidemia(deltaT, SIR_STATE)
    
    % Parametros iniciais
    a = 0.002 / 7; % Taxa de infeção por dia
    r = 0.15; % Taxa de recuperação por dia

    S = SIR_STATE(1);
    I = SIR_STATE(2);
    R = SIR_STATE(3);

    % O número de recuperados não depende dos próprios recuperados
    % Apenas depende da taxa de infeção dos infetados.
    dS = -a*S*I; 
    dI = a*S*I - r*I; 
    dR = r*I; 
    dState = [dS; dI; dR];
 
end

plot(t, dState)
legend('S', 'I', 'R')
xlabel('Tempo')
ylabel('População')

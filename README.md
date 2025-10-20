# SIR-MODEL-NUMERIC
<div style="display: flex; justify-content: center; margin:1.2em;">
  <img src="assets/EEUM_logo.png" alt="EEUM logo" width="100">
</div>


Este projeto foi realizado no contexto da cadeira de **Simulação Numérica em Engenharia** durante o **Mestrado em Computação Avançada** na **Universidade do Minho**.

## Grupo

  - Diogo Coelho da Silva
  - Tomás Alexandre Torres Pereira

## Modelo SIR
O modelo SIR é um modelo epidemológico utilizado para descrever como a infeção se propaga ao longo de uma epidemia. A palavra SIR é uma referência aos três estados possíveis que o nosso modelo comporta.

  - **S** - Os individuos que se encontram neste estado estão suscetiveis a ser infetados.

  - **I** - Os individuos que se encontram neste estado estão infetados.

  - **R** - Os individuos que se encontram neste estado estão recuperados. No caso de uma epidemia este grupo de individuos representa individuos que ficaram imunes á doença, ou que faleceram.

### Assumpções do Modelo
  O modelo SIR funciona admitindo os seguintes axiomas:

  - O modelo trabalha sobre uma população fechada de tamanho **N**. Isto significa que a qualquer momento no modelo a seguinte equação se verifica:


$$
N = { S(t) + I(t) + R(t)}
$$

  - Admite-se que um individuo afetado passa a ser infecioso com efeito imediato.
  - Todos os individuos da população tem a mesma probabilidade de ser infetado por outros individuos.
  - Inicialmente todos os individuos estão na classe susceptivel exceto o individuo zero. 

### Transição entre Estados e Sistema de Equações

O modelo epidemológico (SIR), contém três parâmetros iniciais que configurarm a maneira como o modelo se comporta.

 - ${\beta}$ - O valor de alfa corresponde à taxa de infeção por pessoa por semana

 - ${\gamma}$ - O valor de gamma corresponde à taxa de recuperados por dia.

- ${N}$ - Número de individuos na população


A imagem a seguir representa a transição entre estados do modelo epidemológico.

<div style="display: flex; justify-content: center; margin:1.2em;">
  <img src="assets/statesepid.png" alt="EEUM logo" width="400">
</div>


O modelo SIR é descrito pelas seguintes equações:

$$
\begin{cases}
\frac{dS}{dt} = -\beta SI\\
\frac{dI}{dt} = -\beta SI + \gamma I\\
\frac{dR}{dt} = \gamma I
\end{cases} 
$$

Os parâmetros iniciais tomaram os seguintes valores:

- $\beta$ = 0.002 (p/pessoa e semana)
- $\gamma$ = 0.15 (p/dia)
- $ N $ = 1001 individuos (1 infetado e 1000 susceptiveis)
 

## Resultados

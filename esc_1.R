
setwd("~/")
dados = read.delim("~/apps/esquema_fatorial/A_FatCruz_ex2.txt")

## exibir um rápido resumo dos dados
dim(dados)
names(dados)

attach(dados)

## mostra as características dos dados para cada coluna
str(dados)

## mostra um resumo dos dados sumarizado 
summary(dados)

## considerar as variáveis TR, A e B como fatores
TR = as.factor(dados$TR) 
A = as.factor(dados$A)
B = as.factor(dados$B)

# capturar variável coluna Y de dados 
RESPOSTA = dados$Y
RESPOSTA

## tapply: aplica uma função em uma matriz irreguar 
# aplica a média(mean) sobre os valores da variável RESPOSTA 
# para coluna devetores A e B 
exemplo2.m = tapply(RESPOSTA, list(A,B), mean)
exemplo2.m

# aplica a média(mean) sobre os valores da variável RESPOSTA 
# para coluna devetores A
exemplo2.mr = tapply(RESPOSTA, A, mean)
exemplo2.mr

# aplica a média(mean) sobre os valores da variável RESPOSTA 
# para coluna devetores Bf
exemplo2.me = tapply(RESPOSTA, B, mean)
exemplo2.me

## exibe a plotagem dos dados
boxplot(RESPOSTA ~ TR, col=c(1,2,3,4,5,6,7,8))

## monta a distribuição da plotagem
# nesse caso terá imagens distriuidas em uma linha e em duas colunas
par(mfrow=c(1,2))
##  mostra a interação dos dados já para o esquema de fatores
# primerio em relação A-B para variável RESPOSTA
# primerio em relação B-A para variável RESPOSTA
interaction.plot(A, B, RESPOSTA)
interaction.plot(B, A, RESPOSTA)

## executa a análise de variância ANOVA da variável RESPOSTA em função de A-B
exemplo.av = aov(RESPOSTA ~ A*B)
summary(exemplo.av)

par(mfrow=c(2,2))
# ploto os dados resultates da análise de variância
plot(exemplo.av)

par(mfrow=c(1,1))
# armazena os dados do resíduo resultante no ANOVA
residuos <- resid(exemplo.av)
plot(dados$A, residuos)


setwd("~/")
dados = read.delim("~/apps/esquema_fatorial/A_FatCruz_ex2.txt")

## exibir um rápido resumo dos dados
dim(dados)
names(dados)

attach(dados)
str(dados)

summary(dados)

TR = as.factor(dados$TR)
A = as.factor(dados$A)
B = as.factor(dados$B)

RESPOSTA = dados$Y
RESPOSTA

## tapply: Apply a Function Over a Ragged Array
exemplo2.m = tapply(RESPOSTA, list(A,B), mean)
exemplo2.m

exemplo2.mr = tapply(RESPOSTA, A, mean)
exemplo2.mr

exemplo2.me = tapply(RESPOSTA, B, mean)
exemplo2.me

boxplot(RESPOSTA ~ TR, col=c(1,2,3,4,5,6,7,8))

par(mfrow=c(1,2,))
interaction.plot(A, B, RESPOSTA)
interaction.plot(B, A, RESPOSTA)

exemplo.av = aov(RESPOSTA ~ A*B)
summary(exemplo.av)


exemplo.mt = model.tables(exemplo.av, ty="means")
exemplo.mt

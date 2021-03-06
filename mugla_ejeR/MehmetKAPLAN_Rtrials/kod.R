### Basit işlemler
2+3
2-3
2*3
2/3
2^3
sonuc<-2*3
sonuc
### Vektör ve matrisler
vektor<-c(2,3,1)
vektor
matris1<-matrix(c(2,3,1,1,2,2), nrow=2, ncol=3)
matris2<-matrix(c(2,3,1,1,2,2), nrow=3, ncol=2)
matris1
matris2
t(matris1)
matris1[1,]
matris1[,1]
matris1[1,2]
matris1+matris1
matris1*matris1
matris1%*%matris2

### Verinin okunması
veri1<-read.table(file="electrical_data.txt", header=TRUE)
### Veride bulunan başlıklar
names(veri1)
### Sadece ilgili başlığa ait verinin gösterimi
veri1$Capital_costs
### Veri ile basit işlemler
tmp1<-veri1$Capital_costs
tmp1
tmp2<-2*tmp1-30
tmp2

### SPSS veri dosyasının okunması
#install.packages("foreign")
library(foreign)
veri2<-read.spss("hsb.sav", to.data.frame=TRUE)
names(veri2)
### MATH verisi için histogram çizimi
hist(veri2$MATH)
### Normal dağılım testi: eğer p değeri 0.5ten küçükse normal dağılım yoktur
shapiro.test(veri2$MATH) 

### Regresyon analizi (http://www.r-tutor.com/elementary-statistics/simple-linear-regression)
### Help->lm fonksiyonu nasıl kullanılır 
fit<-lm(veri1$Capital_costs ~ veri1$Energy_costs + veri1$Electrical_output, data=veri1)
summary(fit)
### Model parametre-katsayıları (model coefficients)
coefficients(fit)
### Model parametre güven aralıkları (confidence intervals for model parameters)
confint(fit, level=0.95)
### Kestirim değerleri (predicted values)
fitted(fit)
### Artık değerleri (residuals)
residuals(fit) # residuals
### anova tablosu (anova table)
anova(fit) 
### varyans-kovaryans matrisi (covariance matrix for model parameters)
vcov(fit) 
### regresyon tanıları (regression diagnostics)
influence(fit)  
### regresyon tanı grafikleri (diagnostic plots)
layout(matrix(c(1,2,3,4),2,2))  
plot(fit)



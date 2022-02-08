#make sure make file spelling is correct like in makefile m should be big
help:
	@printf "\033[32mRoboshop roboshop v$(version)\033[0m\n\n"
    	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

common:
	@sh components/common.sh
cart: common
	@sh	components/cart.sh
catalogue: common
	@sh	components/catalogue.sh
Frontend: common
	@sh	components/Frontend.sh

 #cart:
 #	@sudo sh	components/cart.sh
 #catalogue:
 #	@sudo sh	components/catalogue.sh
 #Frontend.sh:
 #	@sudo sh	components/Frontend.sh
 #the main reason behind adding common and removing sudo is in certain
 #commands we need root user permission for which we're using sudo
 #but even in sudo our user id still shows 1000(centos) insted of root (0)
 #to avoid that and give access as root we use a common script.define


#and this common we want to excute always in sens when cart or catalogue
#or frontend .etc. is excuted it has to see whats in common first then
#excute cart or cata or fr or etc.. so common is dependency (cart: common)
#it calles common first and then make files

 #the reason behind removing sudo is we dont want to repeate sudo everytime


#!/bin/bash

#Wipe out the Smart Connection Book Support folder, if it exists
smartConnectionBookSupportDirectory="/Applications/Adobe InDesign 2020/Scripts/Scripts Panel/WoodWing Studio Book Support"                                        

if [ -d "${smartConnectionBookSupportDirectory}" ]
then
        rm -rf "${smartConnectionBookSupportDirectory}"                                                                                                               
fi

#List of receipt names to forget
receiptsToForget=( com.woodwing.woodwingstudio2020.payload.pkg com.woodwing.woodwingstudio.indesign2020.pkg )

#Forget the receipts in the receiptsToForget array
for receiptName in "${receiptsToForget[@]}"
do
	if pkgutil --pkgs="${receiptName}" > /dev/null 2>&1
	then
		pkgutil --forget "${receiptName}" 
	else
		echo Receipt to remove "${receiptName}" NOT FOUND
	fi
done

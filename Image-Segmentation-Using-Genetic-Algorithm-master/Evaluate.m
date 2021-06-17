function evaluatioinOutputs = Evaluate(image,out)

psnr = PSNR(out,image);

imageTenengrad = Tenengrad(image);
outputTenengrad = Tenengrad(out);


imageContrast = Contrast(image);
outputContrast = Contrast(out);

evaluatioinOutputs =[ psnr , outputTenengrad, outputContrast]

end


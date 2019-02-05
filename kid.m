clear all;
a = image;
def_imag = a.CData;
close all
surf(def_imag)
view(180,90)
colormap(bone)
%pause(3)
blackened_pixels = ones(size(def_imag));
colormap(bone)
kid_im = def_imag;


for j = 0:3
    for i = 0:0
        blackened_pixels(19,32+j) = 0;
        blackened_pixels(19,32-j) = 0;
        if(j <2)
            blackened_pixels(21,32+j) = 0;
            blackened_pixels(21,32-j) = 0;
        end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end


for j = 0:6
    for i = 0:0
        blackened_pixels(19+j,35) = 0;
        blackened_pixels(19+j,29) = 0;
        if(j >1 && j<5)
            blackened_pixels(19+j,33) = 0;
            blackened_pixels(19+j,31) = 0;
        end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end

for j = 0:3
    for i = 0:0
        blackened_pixels(25,32+(3-j)) = 0;
        blackened_pixels(25,32-(3-j)) = 0;
        if(j >1)
        blackened_pixels(23,32+(3-j)) = 0;
        blackened_pixels(23,32-(3-j)) = 0;
        blackened_pixels(22,32+(3-j)) = 0;
        blackened_pixels(22,32-(3-j)) = 0;
        end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end


for j = 0:2
    for i = 0:5
        blackened_pixels(22-j,35+i + 5*j) = 0;
        blackened_pixels(22-j,29-i -5*j ) = 0;
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end



for j = 0:2
    for i = 0:5
        if(51+i + 5*j<65)
            blackened_pixels(51+i + 5*j,44 -j) = 0;
        end
        if(53+i + 5*j<65)
            blackened_pixels(53+i + 5*j,23 - j ) = 0;
        end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end




for j = 0:6
    for i = 0:0
            blackened_pixels(55,60-j) = 0;
            blackened_pixels(59,60-j) = 0;
            blackened_pixels(55,4+j ) = 0;
            blackened_pixels(59,4+j ) = 0;
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end


for j = 0:3
    for i = 0:1
      %  if((j~=3)||(i~=1))
            blackened_pixels(55+ i + 2*j,60-j) = 0;
            blackened_pixels(59 -i -2*j ,54+j) = 0;
            blackened_pixels(55 + i + 2*j,4+j ) = 0;
            blackened_pixels(59 -i -2*j,10-j ) = 0;
       % end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end



for j = [3 2 1 0]
    for i = [1 0]
       % if((j~=3)||(i~=1))
            blackened_pixels(59- i - 2*j,60-j) = 0;
            blackened_pixels(55 +i +2*j ,54+j) = 0;
            blackened_pixels(59 - i - 2*j,4+j ) = 0;
            blackened_pixels(55 +i +2*j,10-j ) = 0;
       % end
        kid_im = kid_im.*blackened_pixels;
        surf(kid_im)
        view(180,90)
        pause(0.1)
        
    end
end


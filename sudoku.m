function [S, t] = sudoku(S)
N=75;
done=0;
doubledone=0;
move=0;
p=zeros(4,4);

for i = 1:4
  for j = 1:4
    if S(i,j)==0
      p(i,j)=1;
      S(i,j)=round(3*rand)+1;
    end
  end
end

for t = 1:N
  for i = 1:4
    for j = 1:4
      if p(i,j)==1
        c(1) = sum(S(i,:)==1);
        c(1) = c(1) + sum(S(:,j)==1);
        if ((i <= 2)&&(j <= 2))
          c(1) = c(1) + sum(S(1:2,1)==1);
          c(1) = c(1) + sum(S(1:2,2)==1);
        elseif ((i <= 2)&&(j > 2))
          c(1) = c(1) + sum(S(1:2,3)==1);
          c(1) = c(1) + sum(S(1:2,4)==1);
        elseif ((i > 2)&&(j <= 2))
          c(1) = c(1) + sum(S(3:4,1)==1);
          c(1) = c(1) + sum(S(3:4,2)==1);
        else
          c(1) = c(1) + sum(S(3:4,3)==1);
          c(1) = c(1) + sum(S(3:4,4)==1);
        end
        c(2) = sum(S(i,:)==2);
        c(2) = c(2) + sum(S(:,j)==2);
        if ((i <= 2)&&(j <= 2))
          c(2) = c(2) + sum(S(1:2,1)==2);
          c(2) = c(2) + sum(S(1:2,2)==2);
        elseif ((i <= 2)&&(j > 2))
          c(2) = c(2) + sum(S(1:2,3)==2);
          c(2) = c(2) + sum(S(1:2,4)==2);
        elseif ((i > 2)&&(j <= 2))
          c(2) = c(2) + sum(S(3:4,1)==2);
          c(2) = c(2) + sum(S(3:4,2)==2);
        else
          c(2) = c(2) + sum(S(3:4,3)==2);
          c(2) = c(2) + sum(S(3:4,4)==2);
        end
        c(3) = sum(S(i,:)==3);
        c(3) = c(3) + sum(S(:,j)==3);
        if ((i <= 2)&&(j <= 2))
          c(3) = c(3) + sum(S(1:2,1)==3);
          c(3) = c(3) + sum(S(1:2,2)==3);
        elseif ((i <= 2)&&(j > 2))
          c(3) = c(3) + sum(S(1:2,3)==3);
          c(3) = c(3) + sum(S(1:2,4)==3);
        elseif ((i > 2)&&(j <= 2))
          c(3) = c(3) + sum(S(3:4,1)==3);
          c(3) = c(3) + sum(S(3:4,2)==3);
        else
          c(3) = c(3) + sum(S(3:4,3)==3);
          c(3) = c(3) + sum(S(3:4,4)==3);
        end
        c(4) = sum(S(i,:)==4);
        c(4) = c(4) + sum(S(:,j)==4);
        if ((i <= 2)&&(j <= 2))
          c(4) = c(4) + sum(S(1:2,1)==4);
          c(4) = c(4) + sum(S(1:2,2)==4);
        elseif ((i <= 2)&&(j > 2))
          c(4) = c(4) + sum(S(1:2,3)==4);
          c(4) = c(4) + sum(S(1:2,4)==4);
        elseif ((i > 2)&&(j <= 2))
          c(4) = c(4) + sum(S(3:4,1)==4);
          c(4) = c(4) + sum(S(3:4,2)==4);
        else
          c(4) = c(4) + sum(S(3:4,3)==4);
          c(4) = c(4) + sum(S(3:4,4)==4);
        end

        c(S(i,j))=c(S(i,j))-1;

        for f = 1:4
          if c(f) < 0
            c(f) = 0;
          end
        end

        move=0;
        z=rand;
        if z<0.9
          [y,x]=min(c);
          if ne(y, S(i,j))
            S(i,j)=x;
            move=1;
          end
        end
      end
    end
  end
end

end

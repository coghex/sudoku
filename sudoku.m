function [S, t, done, phi] = sudoku(S, T)
N=50000;
done=zeros(N,1);
doubledone=0;
move=0;
p=zeros(9,9);
q=zeros(9,1);
phi=zeros(N,1);

for i = 1:9
  for j = 1:9
    if S(i,j)==0
      p(i,j)=1;
      S(i,j)=round(8*rand)+1;
    end
  end
end

for t = 1:N
  if done(t)~=27
    phi(t)=0;
    for i = 1:9
      for j = 1:9
        if ((p(i,j)==1))
          for k=1:9
            c(k) = sum(S(i,:)==k);
            c(k) = c(k) + sum(S(:,j)==k);
            if ((i<=3)&&(j<=3))
              c(k) = c(k) + sum(sum(S(1:3,1:3)==k));
            elseif ((i<=3)&&(j>3)&&(j<=6))
              c(k) = c(k) + sum(sum(S(1:3,4:6)==k));
            elseif ((i<=3)&&(j>6))
              c(k) = c(k) + sum(sum(S(1:3,7:9)==k));
            elseif ((i>3)&&(i<=6)&&(j<=3))
              c(k) = c(k) + sum(sum(S(4:6,1:3)==k));
            elseif ((i>3)&&(i<=6)&&(j>3)&&(j<=6))
              c(k) = c(k) + sum(sum(S(4:6,4:6)==k));
            elseif ((i>3)&&(i<=6)&&(j>6))
              c(k) = c(k) + sum(sum(S(4:6,7:9)==k));
            elseif ((i>6)&&(j<=3))
              c(k) = c(k) + sum(sum(S(7:9,1:3)==k));
            elseif ((i>6)&&(j>3)&&(j<=6))
              c(k) = c(k) + sum(sum(S(7:9,4:6)==k));
            else
              c(k) = c(k) + sum(sum(S(7:9,7:9)==k));
            end
          end

          c(S(i,j))=c(S(i,j))-3;

          for f = 1:9
            if c(f) < 0
              c(f) = 0;
            end
          end

          phi(t)=phi(t)+c(S(i,j));

          for f = 1:9
            c(f)=24-c(f);
          end

          move=0;
          denom=(exp((1/T)*(c(1)))+exp((1/T)*(c(2)))+exp((1/T)*(c(3)))+exp((1/T)*(c(4)))+exp((1/T)*(c(5)))+exp((1/T)*(c(6)))+exp((1/T)*(c(7)))+exp((1/T)*(c(8)))+exp((1/T)*(c(9))));

          for f=1:9
            q(f)=(exp((1/T)*(c(f))))/denom;
          end

          for f=1:9
            if isnan(q(f))
              q(f)=1;
            end
          end

          S(i,j) = find(rand<cumsum([q(1),q(2),q(3),q(4),q(5),q(6),q(7),q(8),q(9)]),1);
          move=1;

          done(t+1)=0;
          for m=1:9
            if sum(S(m,:))==45
              done(t+1) = done(t+1)+1;
            end
            if sum(S(:,m))==45
              done(t+1) = done(t+1)+1;
            end
          end
          if sum(sum(S(1:3,1:3)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(4:6,1:3)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(7:9,1:3)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(1:3,4:6)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(4:6,4:6)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(7:9,4:6)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(1:3,7:9)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(4:6,7:9)))==45
            done(t+1) = done(t+1)+1;
          end
          if sum(sum(S(7:9,7:9)))==45
            done(t+1) = done(t+1)+1;
          end
        end
      end
    end
    phi(t)=phi(t)/2;
  else
    break;
  end
end

end

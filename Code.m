load('COVIDbyCounty.mat')

figure
subplot(2,1,1)
plot(CNTY_COVID(1,:))
subplot(2,1,2)
plot(CNTY_COVID(15,:))

all_diffs = zeros(225,130); %change to 225 (225 are the counties)
place = 1;
OneThirty_place = 1;
second_place = 1;
i = 1;

for b = CNTY_COVID(place,:)
    OneThirty_place = 1;
    for a = CNTY_COVID(place,:)
      if OneThirty_place <= 130
        second_place = place + 1;
        values_sub1 = CNTY_COVID(place,OneThirty_place);
        values_sub2 = CNTY_COVID(second_place,OneThirty_place);
        diff = (values_sub1 - values_sub2);
        all_diffs(place,:) = diff;
        place = place + 1;
        OneThirty_place = OneThirty_place + 1;
      end
    end
end

temp = CNTY_COVID.';
temp1 = corr(temp);
plot(temp1);
max1 = max(temp1);

subplot(1,2,1)
plot(temp1(1,:));
subplot(1,2,2)
plot(temp1(10,:));
temp3 = kmeans(CNTY_COVID,9);
sil1 = silhouette(CNTY_COVID, temp3);

figure
[sil1, H] = silhouette(CNTY_COVID, temp3);

%the counties most similar to each other fall under the same division. k
%means should cluster them according to the right divisions. Up to us to
%make sure they match

%kmeans(all_diffs,9)


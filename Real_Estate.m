%mengambil data real estate sesuai variabel yang telah ditentukan
M = Realestatevaluationdataset1;

%mengubah tabel ke matrix
M = M{:,:};

%atribut tiap-tiap kriteria dimana 0 = cost dan 1 = benefit
k = [0, 0, 1, 0];

%bobot kriteria perkategori secara urut 
w = [3, 5, 4, 1];

%normalisasi bobot
[m n] = size (M); %inisialisasi ukuran

w = w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, 
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(M(i,:).^w);
end;

%tahapan ketiga, proses perangkingan
V = S/sum(S)
V = V' * 10
V =  array2table(V)

disp("Hasil Akhir : ")
AB = [Realestatevaluationdataset, V]




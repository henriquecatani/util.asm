#include <iostream>
#include <cstdint>
using namespace std;

// g++ fat.cpp funcoes.o -o fat
extern "C" int64_t menor(int64_t);
extern "C" int64_t maior(int64_t);
int main (void)
{
	const int N = 5;
	int64_t = min, maj, n;
	cout << "Insira " << N << "inteiros: \n";
	cin >> min >> maj;

	for (int i = 0; i < N-1; i++)
	{
		cin >> n;
		min = menor(n, min);
		maj = maior(n, maj);
	}
	int64_t per = maj * min; 
	cout << "Periodo: " << per << endl;
}

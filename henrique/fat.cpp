#include <iostream>
#include <cstdint>
using namespace std;

// g++ fat.cpp funcoes.o -o fat
extern "C" int64_t fatorial(int64_t);

int main(){
	int64_t n, f;
	
	cout << "Informe um inteiro: ";
	cin >> n;
	f = fatorial(n);
	cout << f;
}

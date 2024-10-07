// 3) Dado um vetor que guarda o valor de faturamento diário de uma distribuidora de todos os dias de um ano, faça um programa, na linguagem que desejar, que calcule e retorne:

// - O menor valor de faturamento ocorrido em um dia do ano;
// - O maior valor de faturamento ocorrido em um dia do ano;
// - Número de dias no ano em que o valor de faturamento diário foi superior à média anual.

// a) Considerar o vetor já carregado com as informações de valor de faturamento.

// b) Podem existir dias sem faturamento, como nos finais de semana e feriados. Estes dias devem ser ignorados no cálculo da média.

// c) Utilize o algoritmo mais veloz que puder definir.


// Vetor de faturamento diário de uma distribuidora
let faturamentos = [1500.00, 2500.50, 0.00, 3000.00, 4500.75, 0.00, 2000.25, 3500.00, 4000.00, 0.00];

let menorFaturamento = Number.POSITIVE_INFINITY;
let maiorFaturamento = Number.NEGATIVE_INFINITY;
let somaFaturamento = 0;
let diasComFaturamento = 0;

for (let faturamento of faturamentos) {
    if (faturamento > 0) {
        if (faturamento < menorFaturamento) {
            menorFaturamento = faturamento;
        }
        if (faturamento > maiorFaturamento) {
            maiorFaturamento = faturamento;
        }
        somaFaturamento += faturamento;
        diasComFaturamento++;
    }
}

let mediaFaturamento = somaFaturamento / diasComFaturamento;

let diasAcimaDaMedia = 0;
for (let faturamento of faturamentos) {
    if (faturamento > mediaFaturamento) {
        diasAcimaDaMedia++;
    }
}

// - O menor valor de faturamento ocorrido em um dia do ano;
console.log("Menor valor de faturamento: R$ " + menorFaturamento.toFixed(2).replace('.', ','));

// - O maior valor de faturamento ocorrido em um dia do ano;
console.log("Maior valor de faturamento: R$ " + maiorFaturamento.toFixed(2).replace('.', ','));

// - Número de dias no ano em que o valor de faturamento diário foi superior à média anual.
console.log("Número de dias com faturamento acima da média: " + diasAcimaDaMedia);

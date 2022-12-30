import 'package:alpha_conecta/src/features/carteira_de_vendas/model/carteira_vendas_model.dart';
import 'package:flutter/material.dart';

class CarteiraDetalhe extends StatefulWidget {
  CarteiraVendasModel item;
  CarteiraDetalhe({super.key, required this.item});

  @override
  State<CarteiraDetalhe> createState() => _CarteiraDetalheState();
}

class _CarteiraDetalheState extends State<CarteiraDetalhe> {
  TextStyle styletxt = TextStyle(color: Colors.black.withOpacity(0.6));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atendimento'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filial: ${widget.item.zV0FILIAL}  '),
                      Text('Atendimento: ${widget.item.zV0NUMTRA}')
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tipo Vend: ${widget.item.zV0TPVEN}  ',
                        style: styletxt,
                      ),
                      Text(
                        'Data Movto: ${widget.item.zV0DATMOV}  ',
                        style: styletxt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Cliente: ${widget.item.zV0CODCLI}  '),
                      Text('Loja: ${widget.item.zV0LOJA}')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${widget.item.zV0NOME}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filial: ${widget.item.zV0FILIAL}  '),
                      Text('Atendimento: ${widget.item.zV0NUMTRA}')
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tipo Vend: ${widget.item.zV0TPVEN}  ',
                        style: styletxt,
                      ),
                      Text(
                        'Data Movto: ${widget.item.zV0DATMOV}  ',
                        style: styletxt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Historico: ${widget.item.zV0HIST}  ',
                        style: styletxt,
                      ),
                      Text(
                        'Observacao : ${widget.item.zV0OBS}  ',
                        style: styletxt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}



// zV0FDD1  	Dt FDD1     	09
// zV0MOD1  	Modelo 1    	10
// zV0NPED2 	Cotacao 2   	11
// zV0FDD2  	Dt FDD2     	12
// zV0MOD2  	Modelo 2    	13
// zV0VALMOV	Valor Venda 	14
// zV0BANCO 	Banco       	15
// zV0BCODES	Desc.Bco    	16
// zV0XPEDID	Num.Ped     	18
// zV0STATUS	Sts Atend   	19
// zV0SITCAR	Status      	20
// zV0HIST  	Historico   	21
// zV0OBS   	Observacao  	22
// zV0CODVEN	Cod.Vend.   	23
// zV0NOMVEN	Vendedor    	24
// zV0NRPROC	Num.Proc    	25
import 'package:alpha_conecta/src/features/carteira_de_vendas/controller/carteira_vendas_service.dart';
import 'package:alpha_conecta/src/share/components/button_widget.dart';
import 'package:alpha_conecta/src/share/components/imput_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';

class CarteiraFiltro extends StatefulWidget {
  const CarteiraFiltro({super.key});

  @override
  State<CarteiraFiltro> createState() => _CarteiraFiltroState();
}

class _CarteiraFiltroState extends State<CarteiraFiltro> {
  CarteiraVendasService carteiraService =
      Provider.of<CarteiraVendasService>(navigatiorKey.currentContext!);
  TextEditingController? datacontrole;
  TextEditingController? filialcontrole;
  TextEditingController? clientecontrole;

  @override
  void initState() {
    super.initState();
    datacontrole = TextEditingController();
    filialcontrole = TextEditingController();
    clientecontrole = TextEditingController();
  }

  @override
  void dispose() {
    datacontrole = null;
    filialcontrole = null;
    clientecontrole = null;
    carteiraService.close();
    super.dispose();
  }

  getviewrender(carteiraService) {
    if (carteiraService.isloading) {
      return Column(
        children: const [
          Text('Carregando dados..'),
          CircularProgressIndicator(),
        ],
      );
    } else if (carteiraService.msgerror.isNotEmpty) {
      return Column(
        children: const [Text('Falha ao carregar lista')],
      );
    } else {
      return ListView.builder(
          itemCount: carteiraService.mapCarteiraVendas!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 3, left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight,
              ),
              child: ListTile(
                leading: Column(children: [
                  const Text('Filial'),
                  Text(carteiraService.mapCarteiraVendas![index].zV0FILIAL
                      .toString()),
                ]),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Atendimento: ${carteiraService.mapCarteiraVendas![index].zV0NUMTRA}'),
                    Text(
                        'Cliente : ${carteiraService.mapCarteiraVendas![index].zV0CODCLI} - ${carteiraService.mapCarteiraVendas![index].zV0LOJA}'),
                    Text(carteiraService.mapCarteiraVendas![index].zV0NOME
                        .toString())
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Tipo Vend : ${carteiraService.mapCarteiraVendas![index].zV0TPVEN}'),
                    Text(
                        'Status: ${carteiraService.mapCarteiraVendas![index].zV0SITCAR}')
                  ],
                ),
                // trailing: Text('trailing'),
                onTap: () {
                  Navigator.of(context).pushNamed('/CarteiraDetalhe',
                      arguments: carteiraService.mapCarteiraVendas![index]);
                },
                onLongPress: () {
                  Navigator.of(context).pushNamed('/CarteiraDetalhe',
                      arguments: carteiraService.mapCarteiraVendas![index]);
                },
              ),
            );
          });

      // zV0VALMOV	Valor Venda 	14
      // zV0SITCAR	      	20
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira Vendas Filtros'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // ImputTextWidget(
          //   controller: datacontrole,
          // ),
          ImputTextWidget(controller: filialcontrole),
          ButtonWidiget(
            title: 'pesquisar',
            altura: 45,
            onPressed: () {
              context.read<CarteiraVendasService>().consultaCarteiraVendas();
            },
          ),
          SizedBox(
            height: 600,
            child: getviewrender(carteiraService),
          ),
        ]),
      ),
    );
  }
}

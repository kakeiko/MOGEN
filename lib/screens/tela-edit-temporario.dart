import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/controllers/temporario_controller.dart';
import 'package:mogen/screens/temporarios.dart';
import 'package:mogen/services/temporario_service.dart';

class TelaEditTemporario extends StatefulWidget {

  final String? nome;
  final String? categoria;
  final String? valor;
  final String? pagamento;
  final String? banco;
  final String? diaInicial;
  final String? diaFinal;
  final int? id2;
  final int? id;

const TelaEditTemporario({ Key? key, required this.id, required this.nome, required this.categoria, required this.valor, required this.pagamento, required this.banco, required this.diaInicial, required this.diaFinal, required this.id2 }) : super(key: key);

  @override
  State<TelaEditTemporario> createState() => _TelaEditTemporarioState();
}

class _TelaEditTemporarioState extends State<TelaEditTemporario> {
  final controller = TemporarioController();

  _success() {

    String nome = widget.nome.toString();
    String categoria = widget.categoria.toString();
    String valor = widget.valor.toString();
    String pagamento = widget.pagamento.toString();
    String banco = widget.banco.toString();
    String diaInicial = widget.diaInicial.toString();
    String diaFinal = widget.diaFinal.toString();
    int? id2 = widget.id2;

    final _nomeController = TextEditingController(text:'$nome');
    final _formkeycategoria = GlobalKey<FormBuilderState>();
    final _valorController = TextEditingController(text:'$valor');
    final _formkeypagamento = GlobalKey<FormBuilderState>();
    final _bancoController = TextEditingController(text:'$banco');
    final _diaInicialController = TextEditingController(text: '$diaInicial');
    final _diaFinalController = TextEditingController(text: '$diaFinal');

    

    List<String> categoriaOptions = ['Lazer', 'Comida', 'Tecnologia', 'viagem', 'outros'];

    List<String> pagamentosOptions = ['Dinheiro', 'Cartão de crédito', 'Cartão de débito', 'Cheque', 'Pix', 'Outros'];


    return ListView(
        scrollDirection: Axis.vertical,
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromRGBO(192, 187, 157, 1),)
                ),
                ]
            ),
            
            const SizedBox(
              height: 10,
            ),
        
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edite um gasto',
                  style: GoogleFonts.secularOne(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
                Text(
                  'temporário',
                  style: GoogleFonts.secularOne(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
        
                const SizedBox(
                  height: 40,
                ),
        
                Image.asset(
                  'assets/imagens/linha.png',
                ),
        
                const SizedBox(
                  height: 80,
                ),
        
                Form(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 63, 0),
                    child: 
                    Column(
                      children: [
                        TextFormField(
                          controller: _nomeController,
                          decoration: InputDecoration(                      
                            labelText: 'Nome',
                            labelStyle: GoogleFonts.secularOne(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 0,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 4,
                                ),
                              ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
        
                const SizedBox(
                  height: 15,
                ),
        
                FormBuilder(
                  key: _formkeycategoria,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 206, 0),
                    child: FormBuilderDropdown(
                      name: 'categoria',
                      items: categoriaOptions.map((categoria) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: categoria,
                              child: Text(categoria),
                                ))
                            .toList(),
                      initialValue: '$categoria',
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        labelStyle: GoogleFonts.secularOne(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                             color: Color.fromRGBO(76, 100, 78, 1),
                             width: 0,
                           ),
                          ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(76, 100, 78, 1),
                            width: 4,
                          ),
                         ),
                      ), 
                    
                                  ),
                  ),
              ),
        
                const SizedBox(
                  height: 15,
                ),
        
                Form(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 206, 0),
                    child: 
                    Column(
                      children: [
                        TextFormField(
                          controller: _valorController,
                          decoration: InputDecoration(                      
                            labelText: 'Valor',
                            labelStyle: GoogleFonts.secularOne(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 0,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 4,
                                ),
                              ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
        
                FormBuilder(
                  key: _formkeypagamento,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 160, 0),
                    child: FormBuilderDropdown(
                      name: 'pagamentos',
                      items: pagamentosOptions.map((pagamentos) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: pagamentos,
                              child: Text(pagamentos),
                                ))
                            .toList(),
                      initialValue: '$pagamento',
                      decoration: InputDecoration(
                        labelText: 'Forma de pagamento',
                        labelStyle: GoogleFonts.secularOne(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                             color: Color.fromRGBO(76, 100, 78, 1),
                             width: 0,
                           ),
                          ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(76, 100, 78, 1),
                            width: 4,
                          ),
                         ),
                      ), 
                    
                                  ),
                  ),
              ),

                const SizedBox(
                  height: 15,
                ),

                Form(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 63, 0),
                    child: 
                    Column(
                      children: [
                        TextFormField(
                          controller: _bancoController,
                          decoration: InputDecoration(                      
                            labelText: 'Banco',
          
                            labelStyle: GoogleFonts.secularOne(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                              ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 0,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(76, 100, 78, 1),
                                width: 4,
                                ),
                              ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                FormBuilder(
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 206, 0),
                    child: FormBuilderDateTimePicker(
                      inputType: InputType.date,
                      controller: _diaInicialController,
                      name: 'inicial',
                      decoration: InputDecoration(
                        labelText: 'Data inicial',
                        labelStyle: GoogleFonts.secularOne(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                             color: Color.fromRGBO(76, 100, 78, 1),
                             width: 0,
                           ),
                          ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(76, 100, 78, 1),
                            width: 4,
                          ),
                         ),
                      ), 
                      ),
                  )
                    ),

                const SizedBox(
                  height: 15,
                ),

                FormBuilder(
                  child: 
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 206, 0),
                    child: FormBuilderDateTimePicker(
                      inputType: InputType.date,
                      controller: _diaFinalController,
                      name: 'final',
                      decoration: InputDecoration(
                        labelText: 'Data final',
                        labelStyle: GoogleFonts.secularOne(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                             color: Color.fromRGBO(76, 100, 78, 1),
                             width: 0,
                           ),
                          ),
                         enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(76, 100, 78, 1),
                            width: 4,
                          ),
                         ),
                      ), 
                      ),
                  )
                    ),

                const SizedBox(
                  height: 60,
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        TemporarioService service = TemporarioService();
                        _formkeycategoria.currentState!.save();
                        _formkeypagamento.currentState!.save();
                        var categoria_value = _formkeycategoria.currentState!.value['categoria'];
                        var pagamento_value = _formkeypagamento.currentState!.value['pagamentos'];
                        service.editer(_nomeController.text, categoria_value, _valorController.text, pagamento_value, _bancoController.text, _diaInicialController.text,_diaFinalController.text, id2).then((result) {
                          if (result) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Temporarios(id: widget.id,),),);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        backgroundColor: Color.fromRGBO(50, 73, 55, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                      ),
                      child: Text(
                      'Editar',
                      style: GoogleFonts.secularOne(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                          ),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),

                    ElevatedButton(
                      onPressed: (){
                        TemporarioService service = TemporarioService();

                        service.delete(id2).then((result) {
                          if (result) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Temporarios(id: widget.id,),),);
                          }   
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        backgroundColor: Color.fromRGBO(50, 73, 55, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                      ),
                      child: Text(
                      'Deletar',
                      style: GoogleFonts.secularOne(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(192, 187, 157, 1)
                          ),
                      ),
                    ),
                  ]
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          ],
          ),
        ]
      );
  }

  _error () {
    return Center(
      child: ElevatedButton(
        child: 
          Text('Tente novamente'),
        onPressed: (){
          
        },
        ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start () {
    return Container();
  }

  stateManagement (TemporarioState state) {
    switch (state) {

      case TemporarioState.start :
        return _start(); 

      case TemporarioState.loading :
        return _loading(); 

      case TemporarioState.success :
        return _success(); 

      case TemporarioState.error :
        return _error(); 


      default:
      return _start();

    }
  }

  @override
  void initState(){

    super.initState();

    controller.start(widget.id);
  }


  @override
  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 42, 32, 1),
      body:  AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
        ),
    );
  }
}
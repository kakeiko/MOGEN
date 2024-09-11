import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mogen/screens/gastos-fixo.dart';
import 'package:mogen/services/fixo_service.dart';

class TelaAddFixo extends StatelessWidget {
  final int? id;
const TelaAddFixo({ Key? key, required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context){

    List<String> categoriaOptions = ['Lazer', 'Comida', 'Tecnologia', 'Viagem', 'Outros'];

    List<String> pagamentosOptions = ['Dinheiro', 'Cartão de crédito', 'Cartão de débito', 'Cheque', 'Pix', 'Outros'];

    final _nomeController = TextEditingController();
    final _formkeycategoria = GlobalKey<FormBuilderState>();
    final _valorController = TextEditingController();
    final _formkeypagamento = GlobalKey<FormBuilderState>();
    final _bancoController = TextEditingController();
    final _diaController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 42, 32, 1),
      body: ListView(
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
                  'Adicione um gasto',
                  style: GoogleFonts.secularOne(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
                Text(
                  'fixo',
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
        
                Form(
                  child:
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
                      initialValue: 'Lazer',
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
                      initialValue: 'Dinheiro',
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

                Form(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 170, 0),
                    child: 
                    Column(
                      children: [
                        TextFormField(
                          controller: _diaController,
                          decoration: InputDecoration(                      
                            labelText: 'Dia do pagamento',
          
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
                  height: 60,
                ),
        
                ElevatedButton(
                  onPressed: () {
                    FixoService service = FixoService();
                    _formkeycategoria.currentState!.save();
                    _formkeypagamento.currentState!.save();
                    var categoria_value = _formkeycategoria.currentState!.value['categoria'];
                    var pagamento_value = _formkeypagamento.currentState!.value['pagamentos'];
                    service.register(_nomeController.text, categoria_value, _valorController.text, pagamento_value, _bancoController.text, _diaController.text, id).then((result) {
                      if (result) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GastosFixo(id: id,),),);
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
                  'Criar',
                  style: GoogleFonts.secularOne(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
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
      ),
    );
  }
}
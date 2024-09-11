import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class Configuracao extends StatelessWidget {
const Configuracao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    List<String> linguaOption = ['Português', 'Inglês'];

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
                  'Configuração',
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
              
                const SizedBox(height: 80,),

                FormBuilder(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(63, 0, 206, 0),
                    child: FormBuilderDropdown(
                      name: 'lingua',
                      items: linguaOption.map((lingua) => DropdownMenuItem(
                              alignment: AlignmentDirectional.center,
                              value: lingua,
                              child: Text(lingua),
                                ))
                            .toList(),
                      initialValue: 'Português',
                      decoration: InputDecoration(
                        labelText: 'Língua',
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
              
                const SizedBox(height: 40,),

                FormBuilder(
                  child: 
                    Padding(
                      padding: EdgeInsets.fromLTRB(63, 0, 100, 0),
                      child: FormBuilderCheckboxGroup(
                        name: 'notificações', 
                        options: [
                          FormBuilderFieldOption(
                              value: 'gastosfixos', child: Text(
                                'Gastos fixos',
                                style: GoogleFonts.secularOne(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(192, 187, 157, 1)
                                    ),
                                )),
                          FormBuilderFieldOption(
                              value: 'gastostemp', child: Text(
                                'Gastos temporários',
                                style: GoogleFonts.secularOne(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(192, 187, 157, 1)
                                    ),
                                )),
                          FormBuilderFieldOption
                          (value: 'dinheirogastar', child: Text(
                            'Dinheiro para gastar',
                            style: GoogleFonts.secularOne(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(192, 187, 157, 1)
                                    ),
                            )),
                        ],
                        activeColor: Color.fromRGBO(76, 100, 78, 1),
                        decoration: InputDecoration(
                          labelText: 'Notificações',
                          labelStyle: GoogleFonts.secularOne(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(192, 187, 157, 1),
                          ),
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
                  height: 120,
                ),
        
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                    backgroundColor: Color.fromRGBO(50, 73, 55, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  child: Text(
                  'Salvar',
                  style: GoogleFonts.secularOne(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(192, 187, 157, 1)
                      ),
                  ),
                ),

              ]
            ),
            ),
        ]),
      ]),
    );
  }
}
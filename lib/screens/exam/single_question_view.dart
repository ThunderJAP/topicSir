import 'package:flutter/material.dart';
import 'package:topik_sir/config/theme_data/theme_data.dart';
import 'package:topik_sir/models/api_response_models/question_model.dart';
class SingleQuestionView extends StatefulWidget {
  final List<Question> question;
  const SingleQuestionView({super.key, required this.question});

  @override
  State<SingleQuestionView> createState() => _SingleQuestionViewState();
}

class _SingleQuestionViewState extends State<SingleQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context,int index){

            return ListTile(
              title:Text(widget.question[index].title.toString()) ,

                subtitle: SizedBox(
                  height: UI().screenWidth()*0.3,
                  child: ListView.builder(
                    itemCount:widget.question[index].answers.length ,
                      itemBuilder: (BuildContext context,int element){
                        var answerList =widget.question[index].answers[element];
                        var value= widget.question[index].answers[element].id.toString();
                      return RadioListTile(
                        title:Text(widget.question[index].answers[element].description.toString()) ,
                          value:value, groupValue: answerList, onChanged: (ind)=>setState(() =>value=ind.toString()));
                    return Text(widget.question[index].answers[element].description.toString());
                  }),
                )

            );
          },
          separatorBuilder: (BuildContext context,int index){
            return const Divider();
          },
          itemCount: widget.question.length),
    );
  }
}

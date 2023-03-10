import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/bloc/global/global_bloc.dart';
import 'package:user_app/common/enums.dart';
import 'package:user_app/widgets/app_bar.dart';
import 'package:user_app/widgets/drawer.dart';
import 'package:user_app/widgets/text_field_base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalBloc globalBloc = BlocProvider.of<GlobalBloc>(context);
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        dynamic adresses = [];
        if (globalBloc.state.user != null && globalBloc.state.user['addresses'] != null) {
          adresses = globalBloc.state.user['addresses'] ?? [];
        }
        return Scaffold(
          drawer: const DrawerF(),
          appBar: const MyAppBar(title: 'Home'),
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const _Head(),
                  const SizedBox(height: 20),
                  _AddressFormField(formKey: formKey),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: adresses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.map_outlined),
                          title: Text('${adresses[index]['name']}'),
                          trailing: const Icon(Icons.more_vert),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Head extends StatelessWidget {
  const _Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = BlocProvider.of<GlobalBloc>(context);
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Text(
          'Welcome ${globalBloc.state.user != null ? '${globalBloc.state.user['name']}' : ''}',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}

class _AddressFormField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _AddressFormField({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = <String, String>{
      'address': '',
    };
    final GlobalBloc globalBloc = BlocProvider.of<GlobalBloc>(context);
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              TextFieldBase(
                labelText: 'Address to add*',
                hintText: 'Cra 54 # 12 - 34',
                prefixIcon: Icons.streetview_sharp,
                validateText: ValidateText.address,
                formProperty: 'address',
                formValues: formValues,
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    globalBloc.add(
                      PostAddress(
                        context: context,
                        address: formValues['address']!,
                      ),
                    );
                    formKey.currentState!.reset();
                  }
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.indigo,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

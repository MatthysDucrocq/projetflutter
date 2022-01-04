import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projetflutter/API/profile.dart';
import 'package:projetflutter/providers/profile.provider.dart';

class DetailsProfile extends ConsumerWidget {
  const DetailsProfile({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(testProfileProvider).map(
        data: _onData,
        error: (error) {
          return const Text("erreur de chargement");
        },
        loading: (loading) {
          return const Text("loading");
        });
  }

}

 Widget _onData(AsyncData<Profile?> data) {
   if(data.value!.name != null){
    return Text(data.value!.name,
                  style: const TextStyle(fontFamily: 'Lilita', fontSize: 20));
 }
 else{
   return const Text('error');
 }
 }
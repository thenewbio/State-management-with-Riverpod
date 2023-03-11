/*
This example is focused on creating a user,
 editing the user with their details maintained
 */

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String uuid;

  Person({required this.name, required this.age, String? uuid})
      : uuid = uuid ?? const Uuid().v4();

  Person updated([String? name, int? age]) =>
      Person(name: name ?? this.name, age: age ?? this.age, uuid: uuid);

  String get displayedName => '$name ($age years old)';
  @override
  bool operator ==(covariant Person other) => uuid == other.uuid;

  @override
  // => Object.has(name,age, uuid). for comparing mutiple field

  int get hashCode => uuid.hashCode;

  @override
  String toString() => 'Person(name: $name, age: $age, uuid: $uuid)';
}

class DataModel extends ChangeNotifier {
  final List<Person> _people = [];

  int get count => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void addPerson(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    notifyListeners();
  }

  void update(Person updated) {
    final index = _people.indexOf(updated);
    final oldPerson = _people[index];
    if (oldPerson.name != updated.name || oldPerson.age != updated.age) {
      _people[index] = oldPerson.updated(
        updated.name,
        updated.age,
      );
      notifyListeners();
    }
  }
}

final peopleProvider = ChangeNotifierProvider((_) => DataModel());

class Example5 extends ConsumerWidget {
  const Example5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Attendance'),
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        final dataModel = ref.watch(peopleProvider);
        return ListView.builder(
            itemCount: dataModel.count,
            itemBuilder: (context, index) {
              final person = dataModel.people[index];
              return ListTile(
                title: GestureDetector(
                  onTap: () async {
                    final updatedPerson =
                        await createOrUpdatePersonDialog(context, person);
                    if (updatedPerson != null) {
                      dataModel.update(updatedPerson);
                    }
                  },
                  child: Text(person.displayedName),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final person = await createOrUpdatePersonDialog(context);
            if (person != null) {
              final dataModel = ref.read(peopleProvider);
              dataModel.addPerson(person);
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}

final namecontroller = TextEditingController();
final ageController = TextEditingController();

Future<Person?> createOrUpdatePersonDialog(
  BuildContext context, [
  Person? existingPerson,
]) {
  String? name = existingPerson?.name;
  int? age = existingPerson?.age;
  namecontroller.text = name ?? '';
  ageController.text = age?.toString() ?? '';

  return showDialog<Person?>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Create a Person'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    labelText: " Enter name here",
                  ),
                  onChanged: (value) => name = value,
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: " Enter age here",
                  ),
                  onChanged: (value) => age = int.tryParse(value),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    if (name != null && age != null) {
                      if (existingPerson != null) {
                        final newPerson = existingPerson.updated(name, age);
                        Navigator.of(context).pop(newPerson);
                      } else {
                        Navigator.of(context)
                            .pop(Person(name: name!, age: age!));
                      }
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'))
            ]);
      });
}

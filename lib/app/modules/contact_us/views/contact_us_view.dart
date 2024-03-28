import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

// **Postadresse:**\n
// Boks 97, Alnabru
// 0614 Oslo
//
// **Besøksadresse:**\n
// Alfaset 1, Industrivei 40
// 668 Oslo
//
// **Kontaktinformasjon:**
// \n**Telefon:** 22 79 20 20
// \n**E-post:** _post@jacobsen-dental.no_
//
// **Åpningstider og direktenummer:**\n
// Vi har åpningstid fra 08.00 til 16.00, mandag til fredag.
//
// Dersom du skulle ha problemer med å komme gjennom, har vi følgende direktenummer til de ulike avdelinger:
//
// Forbruksvarer: 22 79 20 49\n
// Utstyr: 22 79 20 58\n
// Service: 22 79 20 89\n
// Verksted: 22 79 20 79\n
// Regnskap: 22 79 20 29\n
// """;

  final List<ContactInfo> contacts = [
    const ContactInfo(name: 'Regnskap:', number: '22 79 20 29'),
    const ContactInfo(name: 'Verksted:', number: '22 79 20 79'),
    const ContactInfo(name: 'Service:', number: '22 79 20 89'),
    const ContactInfo(name: 'Utstyr:', number: '22 79 20 58'),
    const ContactInfo(name: 'Forbruksvarer:', number: '22 79 20 49'),
  ];

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.padding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostAddress(),
            _buildBookAddress(),
            _buildTelephone(),
            _buildEpost(),
            Text(
              'Åpningstider og direktenummer:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
              'Vi har åpningstid fra 08.00 til 16.00, mandag til fredag.',
            ),
            const SizedBox(height: 10),
            const Text(
              'Dersom du skulle ha problemer med å komme gjennom har vi følgende direktenummer til de ulike avdelinger:',
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactRow(
                  name: contacts[index].name,
                  number: contacts[index].number,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEpost() {
    return Row(
      children: [
        const Text(
          'E-post:',
          style: kDentalTitleStyle,
        ),
        const SizedBox(width: 4),
        Text(
          'post@jacobsen-dental.no',
          style: kDentalSubtitleStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Widget _buildTelephone() {
    return Row(
      children: [
        const Text(
          'Telefon:',
          style: kDentalTitleStyle,
        ),
        SizedBox(width: AppValues.margin_4.w),
        const Text('22 79 20 20'),
      ],
    );
  }

  AddressColumn _buildBookAddress() {
    return const AddressColumn(
      title: 'Besøksadresse:',
      subTitle: 'Alfaset 1. Industrivei 4, 0668 Oslo',
    );
  }

  AddressColumn _buildPostAddress() {
    return const AddressColumn(
      title: 'Postadresse:',
      subTitle: 'Boks 97, Alnabru 0614 Oslo',
    );
  }
}

class ContactInfo {
  final String name;
  final String number;

  const ContactInfo({
    required this.name,
    required this.number,
  });
}

class AddressColumn extends StatelessWidget {
  final String title;
  final String subTitle;

  const AddressColumn({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          subTitle,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final String name;
  final String number;

  const ContactRow({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            name,
            style: kDentalSubtitleStyle,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            number,
            style: kDentalSubtitleStyle,
          ),
        ),
      ],
    );
  }
}

const kDentalTitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const kDentalSubtitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

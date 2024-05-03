# Dental Inventory Management

The Dental Inventory Management project is a comprehensive solution designed to streamline inventory
operations in dental clinics or facilities. Leveraging Zebra devices for efficient scanning
capabilities, it offers the following features:
<br>
<ul>
  <li><b>Inventory Management:</b> Maintain a detailed inventory list with the ability to view, delete, and update inventory items. This ensures accurate tracking of dental supplies and equipment.</li>
  <li><b>Scanning Capabilities:</b> Seamlessly manage product movement by scanning QR codes and barcodes using either the device's camera or the specialized Zebra IR scanner. This feature facilitates quick and error-free product identification during stock in and out processes.
  <li><b>Product Order Suggestion:</b> Utilize intelligent algorithms to analyze inventory levels and suggest product orders based on consumption trends and predefined thresholds. This helps in maintaining optimal stock levels and preventing shortages.</li>
  <li><b>Shopping Cart Integration:</b> Enable users to create and manage shopping carts directly within the application, allowing for convenient ordering of supplies and equipment from Jacobsen.</li>
  <li><b>Integration with ERP Systems:</b> Simplify inventory management by integrating with Enterprise Resource Planning (ERP) systems. This enables automatic synchronization of inventory data, including adding new inventory items and updating existing ones, saving time and reducing manual entry errors.</li>
  <li><b>Order Details:</b> Access comprehensive order details, including order history, status, and itemized lists. Users can track the progress of orders and quickly identify any discrepancies or issues.</li>
</ul>
<br>
Overall, the Dental Inventory Management project offers a user-friendly and efficient solution for dental clinics to effectively manage their inventory, optimize stock levels, and streamline procurement processes using advanced scanning technology and intelligent inventory management features.


# Architecture of this project: MVVM

MVVM (Model View ViewModel) is one of the most popular architectural patterns for Android App
development. Basically,
this pattern separates the User interface from business logic and data logic. So that it's divided
into three layers: The model layer,
the View layer and the View model layer. Let's explore it more deeply.

![mvvm](https://user-images.githubusercontent.com/3769029/137336079-1f3384d0-b9d6-4462-a2c4-4a3d2cc77e8a.png)

<b>ViewModel:</b> At first let's talk about ViewModel. Actually view model is a controller where we
implement our business logic. It receives the data from the model then processes the data according
to
business logic and pushes it into the live data observers which are observing by view.

<b>View:</b> View is the collection of widgets like Text, Image, Dropdown, etc. Which will be
displayed
to the users. Even it controls the user input. When it needs any data it commands the view model (In
this project it's controller)
for data and observes the response. Till then it may display a loader to the user.

<b>Model:</b> Model is basically backend logic. It controls the data source.

# To configure and run this project [check here](doc/README_CONFIGURATION_GUIDELINE.md)

You will find at above link step by step instructions with screenshots.

# Run the project using command line

Dev: `flutter run --flavor dev lib/main_dev.dart`

Prod: `flutter run --flavor prod lib/main_prod.dart`

# How was the project developed?

- Run the [get cli](https://pub.dev/packages/get_cli) command to create the project in the required
  directory: `get create project`
- Create `main_view` by running this command: `get create page:main` and so on...

# Base Urls

Dev: https://devinventorymanagement.azurewebsites.net

Prod: http://inventorybe-prod-pjgpawjrytdxu-webapp.azurewebsites.net

# API Documentations

Dev: https://devinventorymanagement.azurewebsites.net/api/schema/swagger-ui/

Prod: http://inventorybe-prod-pjgpawjrytdxu-webapp.azurewebsites.net/api/schema/swagger-ui/

# Admin Panels

Dev: https://devinventorymanagement.azurewebsites.net/admin/

Prod: http://inventorybe-prod-pjgpawjrytdxu-webapp.azurewebsites.net/admin/

# To get project onboard [check here](doc/README_PROJECT_ONBOARDING.md)

# [Coding Guidelines](doc/README_CODING_GUIDELINES)

# [Architectural Decision Records](doc/README_ARCHITECTURAL_DECISION_RECORDS.md)

# [Incident Reports](doc/README_INCIDENT_REPORTS.md)

# [Release Overview](doc/README_RELEASE_OVERVIEW.md)
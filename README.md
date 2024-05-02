# Dental Inventory Management

Dental Inventory description

# Zebra SDK

[//]: # (<b>Full)

[//]: # (documentation:</b> [Read here]&#40;https://gitlab.com/claysolutions/public/clay-sdk/-/wikis/home&#41;)

[//]: # ()
[//]: # (<b>iOS)

[//]: # (integration:</b> [Read here]&#40;https://gitlab.com/claysolutions/public/clay-sdk/-/wikis/iOS-ClaySDK-Integration&#41;)

[//]: # ()
[//]: # (<b>Android)

[//]: # (integration:</b> [Read here]&#40;https://gitlab.com/claysolutions/public/clay-sdk/-/wikis/Android-ClaySDK-Integration&#41;)

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

Dev: Coming soon...

Prod: Coming soon...

# API Documentations

Dev: Coming soon...

Prod: Coming soon...

# Admin Panels

Dev: Coming soon...

Prod: Coming soon...

# To get project onboard [check here](doc/README_PROJECT_ONBOARDING.md)

# [Architectural Decision Records](doc/README_ARCHITECTURAL_DECISION_RECORDS.md)

# [Incident Reports](doc/README_INCIDENT_REPORTS.md)

# [Release Overview](doc/README_RELEASE_OVERVIEW.md)
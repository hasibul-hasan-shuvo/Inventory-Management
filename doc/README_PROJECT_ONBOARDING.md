Before getting the project onboard, please read
the [Project architecture and Structure](../README.md), [Coding guidelines](README_CODING_GUIDELINES.md),
and [Build Project](README_CONFIGURATION_GUIDELINE.md) first. It’s important to understand the
architecture properly to work on the project. If you are already done with it let’s dig into it.

We have separated this onboarding into two portions. They are:

- Data layer

- Feature layer

Let’s talk about these layers broadly.

# Data Layer

Here we manage the repositories and sources. We have two layers in the source, one for the local and
another for the remote data source. We keep PreferenceManager, DB Manager, and local source classes
in the local data source layer. We manage API calls and it’s contain classes in the remote data
source layer. To work on this first of all create your preferred abstract class and implementation
class in the respective folder (Repositories: lib/app/data/repository, Local Source:
lib/app/data/local, Remote Source: lib/app/data/remote). Then inject the classes in the respective
class from lib/app/bindings to manage dependency injection.

For remote source classes please extend the <b>BaseRemoteSource</b> class to use the base
functionality of network calls. User <b>callApiWithErrorParser</b> method to call the API service.
It handles all the errors centrally and throws the custom exceptions to the view to take action.

# Feature Layer

Here we have Views, Widgets, ViewModels/ Controllers. <b>Views</b> are the main view of a
feature, <b>Widgets</b> are the sub-view of the feature page, and <b>ViewModels/Controllers</b> are
the business logic manager of the feature. To start developing a feature use the below steps:

Open the terminal and navigate to the project root folder. Then run the below command:

```

get create page:feature_name

```

It will create the views, controllers, bindings, and routes of the feature. After creating the
feature folder at first open the feature controller and replace the extended class <b>GetxController
to BaseController</b>. Then open feature view and replace the extended class <b>GetView to
BaseView</b>. Then you will get notified to implement override 2 methods in feature view. Remove the
unnecessary codes and implement override methods. Then start implementing your features.
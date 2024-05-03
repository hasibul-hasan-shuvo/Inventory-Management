These are a set of rules and recommendations that need to be follow when writing code. These
guidelines ensure consistency, readability, maintainability, and reliability of the codebase across
different team members. These guidelines typically cover various aspects of coding style, naming
conventions, formatting, documentation, and best practices.

# Structure and Naming

<ul>
    <li>All shared bindings like Repository and Source binding must be in app/bindings folder. And module specific bindings must be in app/modules/{module-name}/bindings folder.</li>
    <li>All common or shared values, models, services and widgets must be in their respective folders of core.</li>
    <li>Repositories and sources must be implemented in data folder in their respective folders.</li>
    <li>Network related implementations must be have in network folder.</li>
    <li>Feature specific implementations would be under modules folder.</li>
    <li>Each module folder consists with bindings, controllers, views, models, and widgets folders. That contains the module specific implementations.</li>
    <li>Modules, Functions, and Class names should be relevant with their functionality.</li>
    <li>Constant variables names should be followed by upper snack case convention.</li>
    <li>General variables or parameters should be followed by small camel case convention.</li>
    <li>View related logics must be in view not in view-model/controller or data layer.</li>
    <li>All business logic must be maintained from view-model/controller layer.</li>
    <li>All data related logic or operations must be implemented in data layer.</li>
    <li>Every page view must be extended the BaseView.</li>
    <li>Every controller must be extended the BaseController.</li>
    <li>Every widgets must be extended with BaseWidgetMixin class.</li>
</ul>

# General

<ul>
    <li>No hard coded texts should be placed in view. All texts must be managed by app localization.</li>
    <li>All styles must be used from theme styles. No custom or hardcoded style should be in view.</li>
</ul>
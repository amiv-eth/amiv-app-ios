#  Amiv App - iOS

*The idea is to have all social features and helper/admin tools in one app.*

The app uses the AMIV api as its backend. Please also see the Android version as a reference, as this is currently being ported from the Android version.

*Current Maintainer for Questions: domenicw@ethz.ch*

**[amiv App - Android](https://gitlab.ethz.ch/amiv/amiv-app-android)**  
**[amiv API](https://github.com/amiv-eth/amivapi)**, **[Docs](http://api.amiv.ethz.ch/docs)**, **[User Guide](https://github.com/amiv-eth/amivapi/blob/master/docs/User_Guide.md)**  

## Roadmap to v1.0

The following steps are necessary and need to be done before launching the first version of the AMIV app.

- Connect everything to [AMIV api](https://github.com/amiv-eth/amivapi/blob/master/docs/User_Guide.md).
- Fill all views with data from AMIV api.
- Include existing checkin app as micro app.
- Properly localize every view.
- Create missing icons (including app icon, tab icons, onboarding app features icons, micro app icons, etc.).
- Write tests.

## What already works

The following things are already implemented and work.

- All the major views are build and ready to be connected to data from the AMIV api.
- Barcode Micro App

## Developer Information

To develop the app further, the following steps are necessary to get you started.

- Download and install [Xcode](https://itunes.apple.com/ch/app/xcode/id497799835?l=en&mt=12).
- Clone Repo.
   - `git clone https://gitlab.ethz.ch/amiv/amiv-app-ios.git`
- Go to the downloaded folder and open `Amiv.xcodeproj`.
- Create a new branch and start working.
- Stay organised and comment your code so it can be maintained

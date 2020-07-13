//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `CastCell`.
    static let castCell: Rswift.ReuseIdentifier<CastCrewCell> = Rswift.ReuseIdentifier(identifier: "CastCell")
    /// Reuse identifier `movieCell`.
    static let movieCell: Rswift.ReuseIdentifier<MovieCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "movieCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 11 localization keys.
    struct localizable {
      /// en translation: Budget: 
      ///
      /// Locales: en, pt-BR
      static let budget = Rswift.StringResource(key: "budget", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Cast & Crew
      ///
      /// Locales: en, pt-BR
      static let castCrew = Rswift.StringResource(key: "castCrew", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Duration: 
      ///
      /// Locales: en, pt-BR
      static let duration = Rswift.StringResource(key: "duration", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Genres: 
      ///
      /// Locales: en, pt-BR
      static let genres = Rswift.StringResource(key: "genres", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Informations
      ///
      /// Locales: en, pt-BR
      static let informations = Rswift.StringResource(key: "informations", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Oops, an error has occurred!
      ///
      /// Locales: en, pt-BR
      static let errorTitle = Rswift.StringResource(key: "errorTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Overview
      ///
      /// Locales: en, pt-BR
      static let overview = Rswift.StringResource(key: "overview", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Recommendations
      ///
      /// Locales: en, pt-BR
      static let recommendations = Rswift.StringResource(key: "recommendations", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Revenue: 
      ///
      /// Locales: en, pt-BR
      static let revenue = Rswift.StringResource(key: "revenue", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Sorry, something went wrong. Try again later.
      ///
      /// Locales: en, pt-BR
      static let errorDescription = Rswift.StringResource(key: "errorDescription", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: en
      ///
      /// Locales: en, pt-BR
      static let language = Rswift.StringResource(key: "language", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)

      /// en translation: Budget: 
      ///
      /// Locales: en, pt-BR
      static func budget(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("budget", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "budget"
        }

        return NSLocalizedString("budget", bundle: bundle, comment: "")
      }

      /// en translation: Cast & Crew
      ///
      /// Locales: en, pt-BR
      static func castCrew(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("castCrew", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "castCrew"
        }

        return NSLocalizedString("castCrew", bundle: bundle, comment: "")
      }

      /// en translation: Duration: 
      ///
      /// Locales: en, pt-BR
      static func duration(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("duration", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "duration"
        }

        return NSLocalizedString("duration", bundle: bundle, comment: "")
      }

      /// en translation: Genres: 
      ///
      /// Locales: en, pt-BR
      static func genres(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("genres", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "genres"
        }

        return NSLocalizedString("genres", bundle: bundle, comment: "")
      }

      /// en translation: Informations
      ///
      /// Locales: en, pt-BR
      static func informations(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("informations", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "informations"
        }

        return NSLocalizedString("informations", bundle: bundle, comment: "")
      }

      /// en translation: Oops, an error has occurred!
      ///
      /// Locales: en, pt-BR
      static func errorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorTitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorTitle"
        }

        return NSLocalizedString("errorTitle", bundle: bundle, comment: "")
      }

      /// en translation: Overview
      ///
      /// Locales: en, pt-BR
      static func overview(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("overview", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "overview"
        }

        return NSLocalizedString("overview", bundle: bundle, comment: "")
      }

      /// en translation: Recommendations
      ///
      /// Locales: en, pt-BR
      static func recommendations(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("recommendations", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "recommendations"
        }

        return NSLocalizedString("recommendations", bundle: bundle, comment: "")
      }

      /// en translation: Revenue: 
      ///
      /// Locales: en, pt-BR
      static func revenue(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("revenue", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "revenue"
        }

        return NSLocalizedString("revenue", bundle: bundle, comment: "")
      }

      /// en translation: Sorry, something went wrong. Try again later.
      ///
      /// Locales: en, pt-BR
      static func errorDescription(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorDescription", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorDescription"
        }

        return NSLocalizedString("errorDescription", bundle: bundle, comment: "")
      }

      /// en translation: en
      ///
      /// Locales: en, pt-BR
      static func language(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("language", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "language"
        }

        return NSLocalizedString("language", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let movieDetails = StoryboardViewControllerResource<MovieDetailsViewController>(identifier: "movieDetails")
      let movieListViewController = StoryboardViewControllerResource<MovieListViewController>(identifier: "MovieListViewController")
      let name = "Main"

      func movieDetails(_: Void = ()) -> MovieDetailsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: movieDetails)
      }

      func movieListViewController(_: Void = ()) -> MovieListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: movieListViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().movieListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'movieListViewController' could not be loaded from storyboard 'Main' as 'MovieListViewController'.") }
        if _R.storyboard.main().movieDetails() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'movieDetails' could not be loaded from storyboard 'Main' as 'MovieDetailsViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}

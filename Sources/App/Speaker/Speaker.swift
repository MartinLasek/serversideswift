import Vapor

struct Speaker {
    let key: Speaker.Keys
    let imageUrl: String
    let name: String
    let title: String
    let company: String
    let topic: String
    let bio: String
    let twitter: SocialMedia?
    let github: SocialMedia?

    init(
        key: Speaker.Keys,
        imageUrl: String,
        name: String,
        title: String,
        company: String,
        topic: String,
        bio: String,
        twitter: SocialMedia? = nil,
        github: SocialMedia? = nil
    ) {
        self.key = key
        self.imageUrl = imageUrl
        self.name = name
        self.title = title
        self.company = company
        self.topic = topic
        self.bio = bio
        self.twitter = twitter
        self.github = github
    }
}

/// For a new speaker profile ///

/// add new enum case with a unique string identifier
/// For example:
///
/// ```
/// enum Keys: String {
///   case tannerNelson = tanner-nelson
/// }
/// ```
///
/// this will make the following url accessible:
/// `localhost:8080/speakers/tanner-nelson`
///
///
/// Also add a new instance of that new speaker
/// For example:
///
/// ```
/// static func allSpeaker() -> [String: Speaker] {
///   return [
///     Keys.tannerNelson.rawValue:
///     Speaker(
///       key: Speaker.Keys.tannerNelson,
///       imageUrl: "/images/speakers/tanner_nelson.jpeg",
///       name: "Tanner Nelson",
///       title: "Co-Founder",
///       company: "Vapor",
///       topic: "All about Vapor and its future",
///       twitter: Twitter(url: "https://www.twitter.com/tanner0101", name: "tanner0101"),
///       github: Github(url: "https://github.com/tanner0101", name: "tanner0101")
///     )
///   ]
/// }
/// ```
///
/// this will give you the right speaker with:
/// `try req.parameters.next(Speaker.self)`
extension Speaker {
    enum Keys: String {
        case tannerNelson = "tanner-nelson"
        case jamesThomas = "james-thomas"
        case kyleJessup = "kyle-jessup"
        case johannesWeiss = "johannes-weiss"
        case ianPatridge = "ian-patridge"
        case stanislavDombrovsky = "stanislav-dombrovsky"
        case kaitlinMahar = "kaitlin-mahar"
        case kenichiUeno = "kenichi-ueno"
        case markusWyehaeuser = "markus-wyehaeuser"
        case ralphKuepper = "ralph-kuepper"
        case pimStolk = "pim-stolk"
        case marcinKliks = "marcin-kliks"
        case konradFeiler = "konrad-feiler"
    }

    static func allSpeaker() -> [Speaker] {
        return [
            Speaker(
                key: Speaker.Keys.tannerNelson,
                imageUrl: "/images/speakers/tanner_nelson.jpeg",
                name: "Tanner Nelson",
                title: "Co-Founder",
                company: "Vapor",
                topic: "TBD", // ⚠️ TBD
                bio: "TBD", // ⚠️ TBD
                twitter: Twitter(url: "https://www.twitter.com/tanner0101", name: "tanner0101"),
                github: Github(url: "https://github.com/tanner0101", name: "tanner0101")
            ),
            Speaker(
                key: Speaker.Keys.jamesThomas,
                imageUrl: "/images/speakers/james_thomas.png",
                name: "james Thomas",
                title: "Developer advocate",
                company: "IBM",
                topic: "Serverless Swift with Apache OpenWhisk.",
                bio:    """
                        James Thomas is a Developer Advocate for IBM’s Cloud division.
                        James is a huge fan of all thing serverless! He spends his time
                        speaking at conferences, blogging or writing open-source code to share
                        the awesomeness of serverless cloud platforms.
                        """,
                twitter: Twitter(url: "https://twitter.com/thomasj", name: "thomasj"),
                github: Github(url: "https://github.com/jthomas", name: "jthomas")
            ),
            Speaker(
                key: Speaker.Keys.kyleJessup,
                imageUrl: "/images/speakers/kyle_jessup.jpg",
                name: "Kyle Jessup",
                title: "CTO",
                company: "Perfect",
                topic: "Diving into Perfect and Internet of Things.",
                bio:    """
                        Kyle Jessup invented the Perfect framework. A self-taught programmer,
                        he has extensive knowledge of other programming languages including Swift,
                        Java, and C++.
                        """,
                github: Github(url: "https://github.com/kjessup", name: "kjessup")
            ),
            Speaker(
                key: Speaker.Keys.johannesWeiss,
                imageUrl: "/images/speakers/johannes-weiss.png",
                name: "Johannes Weiss",
                title: "Software Engineer, SwiftNIO",
                company: "Apple",
                topic: "TBD", // ⚠️ TBD
                bio: "TBD", // ⚠️ TBD
                twitter: Twitter(url: "https://twitter.com/johannesweiss", name: "johannesweiss"),
                github: Github(url: "https://github.com/weissi", name: "weissi")
            ),
            Speaker(
                key: Speaker.Keys.ianPatridge,
                imageUrl: "/images/speakers/ian-partridge.jpg",
                name: "Ian Partridge",
                title: "Kitura Team Lead Swift",
                company: "IBM",
                topic: "TBD", // ⚠️ TBD
                bio: "TBD", // ⚠️ TBD
                twitter: Twitter(url: "https://twitter.com/alfa", name: "alfa"),
                github: Github(url: "https://github.com/ianpartridge", name: "ianpartridge")
            ),
            Speaker(
                key: Speaker.Keys.stanislavDombrovsky,
                imageUrl: "/images/speakers/stanislav_dombrovsky.jpg",
                name: "Stanislav Dombrovsky",
                title: "AppCode PMM",
                company: "JetBrains",
                topic: "Let’s try thinking like an IDE and take a look on all the challenges that server-side Swift brings to IDE and tool creators.",
                bio:    """
                        A mobile developer with 7 years of experience who joined
                        the AppCode team at JetBrains to combine my experience in mobile
                        development with the new world of making developer tools.
                        """,
                twitter: Twitter(url: "https://twitter.com/s_dombrovsky", name: "s_dombrovsky"),
                github: Github(url: "https://github.com/yeswolf", name: "yeswolf")
            ),
            Speaker(
                key: Speaker.Keys.kaitlinMahar,
                imageUrl: "/images/speakers/kaitlin-mahar.jpg",
                name: "Kaitlin Mahar",
                title: "Software Engineer",
                company: "MongoDB",
                topic: "Ever wonder what’s actually going on inside JSONEncoder and JSONDecoder? A deep dive into Swift’s Encoder and Decoder protocols and writing one your own.",
                bio: "A software engineer in NYC at MongoDB, where I'm the primary engineer working on the new official MongoDB Driver for Swift.",
                twitter: Twitter(url: "https://twitter.com/k__mahar", name: "k__mahar"),
                github: Github(url: "https://github.com/kmahar", name: "kmahar")
            ),
            Speaker(
                key: Speaker.Keys.kenichiUeno,
                imageUrl: "/images/speakers/kenichi_ueno.jpg",
                name: "Kenichi Ueno",
                title: "iOS Developer",
                company: "LINE Corporation",
                topic: "Experiences on how the server-side development looks like, pitfalls an iOS developer might meet and how to deploy.",
                bio: "Has 8 years of iOS development experience at LINE Corporation and uses Kitura for server-side swift development.",
                twitter: Twitter(url: "https://twitter.com/keno42", name: "keno42"),
                github: Github(url: "https://github.com/Keno42", name: "keno42")
            ),
            Speaker(
                key: Speaker.Keys.markusWyehaeuser,
                imageUrl: "/images/speakers/markus_weyerhaeuser.jpg",
                name: "Markus Weyerhäuser",
                title: "CTO",
                company: "SEEDFUNNEL",
                topic: "From idea to market — an extremely challenging journey.",
                bio:    """
                        Markus has more then 20 years of experience in software product development
                        covering the full range of the overall life-cycle from spotting hot
                        technology trends, designing and implementing actual shippable code and
                        analysing the market for a successful product launch.
                        """,
                twitter: Twitter(url: "https://twitter.com/mweyerhaeuser", name: "mweyerhaeuser")
            ),
            Speaker(
                key: Speaker.Keys.ralphKuepper,
                imageUrl: "/images/speakers/ralph_kuepper.jpeg",
                name: "Ralph Küpper",
                title: "CEO",
                company: "Skelpo",
                topic: "Running small microservices in Swift on production environment.",
                bio: "Entrepreneur and developer in upcoming tech markets.",
                twitter: Twitter(url: "https://twitter.com/amlug", name: "amlug"),
                github: Github(url: "https://github.com/proggeramlug", name: "proggeramlug")
            ),
            Speaker(
                key: Speaker.Keys.pimStolk,
                imageUrl: "/images/speakers/pim-stolk.jpg",
                name: "Pim Stolk",
                title: "iOS Chapter Lead",
                company: "ING",
                topic: "TBD.", // ⚠️ TBD
                bio: "TBD", // ⚠️ TBD
                twitter: Twitter(url: "https://twitter.com/stolkcc", name: "stolkcc"),
                github: Github(url: "https://github.com/pimstolk", name: "pimstolk")
            ),
            Speaker(
                key: Speaker.Keys.marcinKliks,
                imageUrl: "/images/speakers/marcin_kliks.jpg",
                name: "Marcin Kliks",
                title: "Devops Team Leader",
                company: "Allegro",
                topic: "Swifty microservices in production - experimenting with Swift on the server @ allegro.tech.",
                bio:    """
                        A Devops Team Leader at Allegro and creator of a data center management
                        software who recently fell in love with server-side swift.
                        """,
                twitter: Twitter(url: "https://twitter.com/vi4m", name: "vi4m"),
                github: Github(url: "https://github.com/vi4m", name: "vi4m")
            ),
            Speaker(
                key: Speaker.Keys.konradFeiler,
                imageUrl: "/images/speakers/konrad-feiler.jpg",
                name: "Konrad Feiler",
                title: "Co-Founder",
                company: "looc.io",
                topic: "How server-side and mobile Swift can benefit from each other.",
                bio:    """
                        A mathematician turned software engineer, Konrad Feiler has been
                        creating mobile apps for the past seven years, and after work as iOS
                        architect for Viacom currently focusses on his own companies.
                        """,
                twitter: Twitter(url: "https://twitter.com/bersaelor", name: "bersaelor"),
                github: Github(url: "https://github.com/bersaelor", name: "bersaelor")
            )
        ]
    }
}
import Vapor
import Fluent
import FluentMySQL

struct YearXController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("about", use: aboutHandler)
        router.get("faq", use: faqHandler)
        router.get("code-of-conduct", use: codeOfConductHandler)
        router.get("speakers", use: speakersHandler)
    }

    func homepageHandler(_ req: Request) throws -> Future<View> {
        let homeContext = HomeContext()
        return try req.view().render("App/YearX/Pages/Home/home", homeContext)
    }
  
    func aboutHandler(_ req: Request) throws -> Future<View> {
        let aboutContext = AboutContext()
        return try req.view().render("App/YearX/Pages/About/about", aboutContext)
    }
  
    func speakersHandler(_ req: Request) throws -> Future<View> {
        let speakerSlugs = ["kaitlin-mahar"]
        return Speaker.query(on: req).filter(\Speaker.slug ~~ speakerSlugs).all().flatMap { speakerList in
          let speakerContext = SpeakerContext(speakerList: speakerList)
          return try req.view().render("App/YearX/Pages/Speaker/speaker", speakerContext)
        }
    }

    func faqHandler(_ req: Request) throws -> Future<View> {
        let faqContext = FaqContext()
        return try req.view().render("App/YearX/Pages/FAQ/faq", faqContext)
    }

    func codeOfConductHandler(_ req: Request) throws -> Future<View> {
        let cocContext = CodeOfConductContext()
        return try req.view().render("App/YearX/Pages/CodeOfConduct/code-of-conduct", cocContext)
    }
}

struct HomeContext: Encodable {
    let page = ["home": true]
}

struct AboutContext: Encodable {
    let page = ["about": true]
}

struct SpeakerContext: Encodable {
    let page = ["speaker": true]
    let speakerList: [Speaker]
}

struct FaqContext: Encodable {
    let page = ["faq": true]
}

struct CodeOfConductContext: Encodable {
    let page = ["code-of-conduct": true]
}

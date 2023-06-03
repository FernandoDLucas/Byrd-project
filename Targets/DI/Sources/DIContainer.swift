import Swinject

public final class DIContainer {
    public static let appContainer = Container()
}

extension Container {
    func get<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = DIContainer.appContainer.resolve(serviceType) else {
            fatalError("\(serviceType) is not configured")
        }
        return service
    }

    func get<Service>() -> Service {
        get(Service.self)
    }
}

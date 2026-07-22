use esp_idf_svc::sys::link_patches;

fn main() {
    link_patches();

    esp_idf_svc::log::EspLogger::initialize_default();

    log::info!("====================================");
    log::info!("  SUCCESS: App reached main()!     ");
    log::info!("====================================");
}

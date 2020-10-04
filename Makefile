.PHONY: all patient_migrate clean

all: get_synthea_jar generate_patients patient_migrate clean

get_synthea_jar:
	@echo "Pulling down Synthea jar file...."
	wget -O ./synthea/synthea-with-dependencies.jar 'https://github.com/synthetichealth/synthea/releases/download/master-branch-latest/synthea-with-dependencies.jar'

generate_patients:
	@echo "Generating 100 patients..."
	java -jar synthea/synthea-with-dependencies.jar -p 100

patient_migrate:
	@echo "Running patient migration..."
	./synthea/post_to_fhir_db.sh -d

clean:
	@echo "Cleaning up..."
	rm -rf ./output
